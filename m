From: Julia Lawall <Julia.Lawall@lip6.fr>
Subject: [PATCH 0/4] add missing of_node_puts
Date: Sun, 13 Jan 2019 09:47:40 +0100
Message-ID: <1547369264-24831-1-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-rockchip@lists.infradead.org
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

VGhlIGRldmljZSBub2RlIGl0ZXJhdG9ycyBwZXJmb3JtIGFuIG9mX25vZGVfZ2V0IG9uIGVhY2gg
aXRlcmF0aW9uLCBzbyBhCmp1bXAgb3V0IG9mIHRoZSBsb29wIHJlcXVpcmVzIGFuIG9mX25vZGVf
cHV0LgoKVGhlIHBhdGNoZXMgZm9yIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jIGFuZApk
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfYmFja2VuZC5jIGNvbnRhaW4gc29tZSBhZGRlZCBv
Zl9ub2RlX3B1dHMgZm9yCndoaWNoIHRoZSBuZWVkIHdhcyBpZGVudGlmaWVkIG1hbnVhbGx5LiAg
RGV0YWlscyBhcmUgaW4gdGhlIHBhdGNoIGxvZ3MuCgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vaW14
L2lteC1sZGIuYyAgICAgICAgICAgfCAgIDI1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8ICAgIDUgKysrKy0KIGRyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9yZ2IuYyB8ICAgIDQgKysrLQogZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjRpX2JhY2tlbmQuYyAgIHwgICAgMSArCiA0IGZpbGVzIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
