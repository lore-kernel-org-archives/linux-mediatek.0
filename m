From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next v3 0/3] net: ethernet: mediatek: convert to PHYLINK
Date: Fri, 23 Aug 2019 15:45:13 +0200
Message-ID: <20190823134516.27559-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org, linux-mips@vger.kernel.org, Russell King <linux@armlinux.org.uk>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, linux-mediatek@lists.infradead.org, Stefan Roese <sr@denx.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

VGhlc2UgcGF0Y2hlcyBjb252ZXJ0cyBtZWRpYXRlayBkcml2ZXIgdG8gUEhZTElOSyBBUEkuCgp2
Mi0+djM6CiogUGh5bGluayBpbXByb3ZlbWVudHMgYW5kIGNsZWFuLXVwcyBhZnRlciByZXZpZXcK
djEtPnYyOgoqIFJlYmFzZSBmb3IgbXQ3Nng4IGNoYW5nZXMKKiBQaHlsaW5rIGltcHJvdmVtZW50
cyBhbmQgY2xlYW4tdXBzIGFmdGVyIHJldmlldwoqIFNHTUlJIHBvcnQgZG9lc24ndCBzdXBwb3J0
IDIuNUdiaXQgaW4gU0dNSUkgbW9kZSBvbmx5IGluIEJBU0UtWCBtb2RlLgogIFJlZmFjdG9yIHRo
ZSBjb2RlLgoKUmVuw6kgdmFuIERvcnN0ICgzKToKICBuZXQ6IGV0aGVybmV0OiBtZWRpYXRlazog
QWRkIGJhc2ljIFBIWUxJTksgc3VwcG9ydAogIG5ldDogZXRoZXJuZXQ6IG1lZGlhdGVrOiBSZS1h
ZGQgc3VwcG9ydCBTR01JSQogIGR0LWJpbmRpbmdzOiBuZXQ6IGV0aGVybmV0OiBVcGRhdGUgbXQ3
NjIyIGRvY3MgYW5kIGR0cyB0byByZWZsZWN0IHRoZQogICAgbmV3IHBoeWxpbmsgQVBJCgogLi4u
L2FybS9tZWRpYXRlay9tZWRpYXRlayxzZ21paXN5cy50eHQgICAgICAgIHwgICAyIC0KIC4uLi9k
dHMvbWVkaWF0ZWsvbXQ3NjIyLWJhbmFuYXBpLWJwaS1yNjQuZHRzICB8ICAyOCArLQogYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaSAgICAgIHwgICAxIC0KIGRyaXZlcnMv
bmV0L2V0aGVybmV0L21lZGlhdGVrL0tjb25maWcgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9u
ZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9wYXRoLmMgIHwgIDc1ICstLQogZHJpdmVycy9u
ZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYyAgIHwgNTI5ICsrKysrKysrKysrKy0t
LS0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuaCAgIHwgIDY4
ICsrLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3NnbWlpLmMgICAgIHwgIDY1
ICsrLQogOCBmaWxlcyBjaGFuZ2VkLCA0NzcgaW5zZXJ0aW9ucygrKSwgMjkzIGRlbGV0aW9ucygt
KQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFybS1rZXJuZWwK
