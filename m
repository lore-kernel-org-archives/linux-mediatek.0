From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v4 3/3] drm/mediatek: fix the wrong pixel clock when
 resolution is 4K
Date: Mon, 12 Sep 2016 11:15:42 +0800
Message-ID: <1473650142.28437.5.camel@mtksdaap41>
References: <1471417088-2993-1-git-send-email-bibby.hsieh@mediatek.com>
 <1471417088-2993-4-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1471417088-2993-4-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Junzhi Zhao <junzhi.zhao@mediatek.com>, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIEJpYmJ5OgoKU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LgoKT24gV2VkLCAyMDE2LTA4LTE3
IGF0IDE0OjU4ICswODAwLCBCaWJieSBIc2llaCB3cm90ZToKPiBGcm9tOiBKdW56aGkgWmhhbyA8
anVuemhpLnpoYW9AbWVkaWF0ZWsuY29tPgo+IAo+IFBpeGVsIGNsb2NrIHNob3VsZCBiZSAyOTdN
SHogd2hlbiByZXNvbHV0aW9uIGlzIDRLLgo+IAoKRnJvbSB0aGUgY29kZSB5b3UgbW9kaWZpZWQs
IEkgdGhpbmsgdGl0bGUgc2hvdWxkIGJlOiAiRW5sYXJnZSBwbGxfcmF0ZQpyYW5nZSBmcm9tICg8
b3JpZ2luYWwgbG93ZXIgYm91bmQ+LCA8b3JpZ2luYWwgdXBwZXIgYm91bmQ+KSB0byAoPG5ldwps
b3dlciBib3VuZD4sIDxuZXcgdXBwZXIgYm91bmQ+KSIKCkluIGRlc2NyaXB0aW9uLCB5b3UgY2Fu
IGV4cGxhaW4gdGhlIHBsbF9yYXRlIGZvciA0SyBhbmQgdGhpcyBlbmxhcmdlbWVudApjb3VsZCBz
dXBwb3J0IG1vcmUgcmVzb2x1dGlvbiBpbmNsdWRlIDRLIChOb3Qgb25seSA0SykuCgo+IFNpZ25l
ZC1vZmYtYnk6IEp1bnpoaSBaaGFvIDxqdW56aGkuemhhb0BtZWRpYXRlay5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8ICAgIDkgKysrKysrKy0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gaW5kZXggMDE4NmU1MC4uOTBmYjgzMSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC00MzIsMTEgKzQzMiwxNiBAQCBzdGF0aWMg
aW50IG10a19kcGlfc2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLAo+ICAJdW5z
aWduZWQgbG9uZyBwbGxfcmF0ZTsKPiAgCXVuc2lnbmVkIGludCBmYWN0b3I7Cj4gIAo+ICsJLyog
bGV0IHBsbF9yYXRlIGNhbiBmaXggdGhlIHZhbGlkIHJhbmdlIG9mIHR2ZHBsbCAoMUd+MkdIeikg
Ki8KPiAgCXBpeF9yYXRlID0gMTAwMFVMICogbW9kZS0+Y2xvY2s7Cj4gLQlpZiAobW9kZS0+Y2xv
Y2sgPD0gNzQwMDApCj4gKwlpZiAobW9kZS0+Y2xvY2sgPD0gMjcwMDApCj4gKwkJZmFjdG9yID0g
MTYgKiAzOwo+ICsJZWxzZSBpZiAobW9kZS0+Y2xvY2sgPD0gODQwMDApCj4gIAkJZmFjdG9yID0g
OCAqIDM7Cj4gLQllbHNlCj4gKwllbHNlIGlmIChtb2RlLT5jbG9jayA8PSAxNjcwMDApCj4gIAkJ
ZmFjdG9yID0gNCAqIDM7Cj4gKwllbHNlCj4gKwkJZmFjdG9yID0gMiAqIDM7Cj4gIAlwbGxfcmF0
ZSA9IHBpeF9yYXRlICogZmFjdG9yOwo+ICAKPiAgCWRldl9kYmcoZHBpLT5kZXYsICJXYW50IFBM
TCAlbHUgSHosIHBpeGVsIGNsb2NrICVsdSBIelxuIiwKClJlZ2FyZHMsCkNLCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
