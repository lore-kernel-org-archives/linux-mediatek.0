From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 11/11] drm: drop uapi dependency from drm_file.h
Date: Thu, 18 Jul 2019 18:15:07 +0200
Message-ID: <20190718161507.2047-12-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@chromium.org>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

ZHJtX2ZpbGUgdXNlZCBkcm1fbWFnaWNfdCBmcm9tIHVhcGkvZHJtL2RybS5oLgpUaGlzIGlzIGEg
c2ltcGxlIHVuc2lnbmVkIGludC4KSnVzdCBvcGVuY29kZSBpdCBhcyBzdWNoIHRvIGJyZWFrIHRo
ZSBkZXBlbmRlbmN5IGZyb20gdGhpcyBoZWFkZXIgZmlsZQp0byB1YXBpLgoKU2lnbmVkLW9mZi1i
eTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTdWdnZXN0ZWQtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNo
cm9taXVtLm9yZz4KQ2M6IExpdml1IER1ZGF1IDxMaXZpdS5EdWRhdUBhcm0uY29tPgpDYzogQ2hy
aXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNYWFydGVuIExhbmtob3Jz
dCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0
PgotLS0KIGluY2x1ZGUvZHJtL2RybV9maWxlLmggfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fZmlsZS5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAppbmRleCA2N2FmNjBiYjUyN2EuLjA0
NmNkMWJmOTFlYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAorKysgYi9pbmNs
dWRlL2RybS9kcm1fZmlsZS5oCkBAIC0zNCw4ICszNCw2IEBACiAjaW5jbHVkZSA8bGludXgvY29t
cGxldGlvbi5oPgogI2luY2x1ZGUgPGxpbnV4L2lkci5oPgogCi0jaW5jbHVkZSA8dWFwaS9kcm0v
ZHJtLmg+Ci0KICNpbmNsdWRlIDxkcm0vZHJtX3ByaW1lLmg+CiAKIHN0cnVjdCBkbWFfZmVuY2U7
CkBAIC0yMjcsNyArMjI1LDcgQEAgc3RydWN0IGRybV9maWxlIHsKIAlzdHJ1Y3QgcGlkICpwaWQ7
CiAKIAkvKiogQG1hZ2ljOiBBdXRoZW50aWNhdGlvbiBtYWdpYywgc2VlIEBhdXRoZW50aWNhdGVk
LiAqLwotCWRybV9tYWdpY190IG1hZ2ljOworCXVuc2lnbmVkIGludCBtYWdpYzsKIAogCS8qKgog
CSAqIEBsaGVhZDoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
