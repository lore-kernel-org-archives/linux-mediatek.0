From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Date: Thu, 18 Jul 2019 18:14:58 +0200
Message-ID: <20190718161507.2047-3-sam@ravnborg.org>
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

ZHJtX3ByaW50LmggdXNlZCBEUk1fTkFNRSAtIHRodXMgYWRkaW5nIGEgZGVwZW5kZW5jeSBmcm9t
CmluY2x1ZGUvZHJtL2RybV9wcmludC5oID0+IHVhcGkvZHJtL2RybS5oCgpIYXJkY29kZSB0aGUg
bmFtZSAiZHJtIiB0byBicmVhayB0aGlzIGRlcGVuZGVuY3kuClRoZSBpZGVhIGlzIHRoYXQgdGhl
cmUgc2hhbGwgYmUgYSBtaW5pbWFsIGRlcGVuZGVuY3kKYmV0d2VlbiBpbmNsdWRlL2RybS8qIGFu
ZCB1YXBpLyoKClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
U3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClJldmlld2VkLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IE1heGltZSBSaXBh
cmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5
LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3Jn
PgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX3ByaW50LmggfCA0
ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2luY2x1ZGUvZHJtL2RybV9wcmlu
dC5oCmluZGV4IGE1ZDZmMmYzZTQzMC4uNzYwZDFiZDBlYWYxIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS9kcm1fcHJpbnQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaApAQCAtMzIsOCAr
MzIsNiBAQAogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L2RlYnVn
ZnMuaD4KIAotI2luY2x1ZGUgPGRybS9kcm0uaD4KLQogLyoqCiAgKiBET0M6IHByaW50CiAgKgpA
QCAtMjg3LDcgKzI4NSw3IEBAIHZvaWQgZHJtX2Vycihjb25zdCBjaGFyICpmb3JtYXQsIC4uLik7
CiAvKiBNYWNyb3MgdG8gbWFrZSBwcmludGsgZWFzaWVyICovCiAKICNkZWZpbmUgX0RSTV9QUklO
VEsob25jZSwgbGV2ZWwsIGZtdCwgLi4uKQkJCQlcCi0JcHJpbnRrIyNvbmNlKEtFUk5fIyNsZXZl
bCAiWyIgRFJNX05BTUUgIl0gIiBmbXQsICMjX19WQV9BUkdTX18pCisJcHJpbnRrIyNvbmNlKEtF
Uk5fIyNsZXZlbCAiW2RybV0gIiBmbXQsICMjX19WQV9BUkdTX18pCiAKICNkZWZpbmUgRFJNX0lO
Rk8oZm10LCAuLi4pCQkJCQkJXAogCV9EUk1fUFJJTlRLKCwgSU5GTywgZm10LCAjI19fVkFfQVJH
U19fKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
