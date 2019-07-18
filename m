From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v1 01/11] drm/panel: make drm_panel.h self-contained
Date: Thu, 18 Jul 2019 13:36:34 -0400
Message-ID: <20190718173634.GD31819@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-2-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-2-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>, Thierry Reding <treding@nvidia.com>, Jani Nikula <jani.nikula@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Boris Brezillon <boris.brezillon@bootlin.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

T24gVGh1LCBKdWwgMTgsIDIwMTkgYXQgMDY6MTQ6NTdQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IEZyb206IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gCj4gRml4
IGJ1aWxkIHdhcm5pbmcgaWYgZHJtX3BhbmVsLmggaXMgYnVpbHQgd2l0aCBDT05GSUdfT0Y9biBv
cgo+IENPTkZJR19EUk1fUEFORUw9biBhbmQgaW5jbHVkZWQgd2l0aG91dCB0aGUgcHJlcmVxdWlz
aXRlIGVyci5oOgo+IAo+IC4vaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmg6IEluIGZ1bmN0aW9uIOKA
mG9mX2RybV9maW5kX3BhbmVs4oCZOgo+IC4vaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmg6MjAzOjk6
IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhFUlJfUFRS4oCZIFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgcmV0dXJuIEVSUl9QVFIo
LUVOT0RFVik7Cj4gICAgICAgICAgXn5+fn5+fgo+IC4vaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmg6
MjAzOjk6IGVycm9yOiByZXR1cm5pbmcg4oCYaW504oCZIGZyb20gYSBmdW5jdGlvbiB3aXRoIHJl
dHVybiB0eXBlIOKAmHN0cnVjdCBkcm1fcGFuZWwgKuKAmSBtYWtlcyBwb2ludGVyIGZyb20gaW50
ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdlcnJvcj1pbnQtY29udmVyc2lvbl0KPiAgIHJldHVybiBF
UlJfUFRSKC1FTk9ERVYpOwo+ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAKPiBGaXhlczog
NWZhOGU0YTIyMTgyICgiZHJtL3BhbmVsOiBNYWtlIG9mX2RybV9maW5kX3BhbmVsKCkgcmV0dXJu
IGFuIEVSUl9QVFIoKSBpbnN0ZWFkIG9mIE5VTEwiKQo+IENjOiBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8
amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGlu
Z0BudmlkaWEuY29tPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+CgpSZXZpZXdlZC1ieTogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+Cgo+IC0tLQo+ICBp
bmNsdWRlL2RybS9kcm1fcGFuZWwuaCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRl
L2RybS9kcm1fcGFuZWwuaAo+IGluZGV4IDhjNzM4YzBlNmU5Zi4uMjYzNzc4MzYxNDFjIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X3BhbmVsLmgKPiBAQCAtMjQsNiArMjQsNyBAQAo+ICAjaWZuZGVmIF9fRFJNX1BBTkVMX0hfXwo+
ICAjZGVmaW5lIF9fRFJNX1BBTkVMX0hfXwo+ICAKPiArI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgo+
ICAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPiAg
Cj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29v
Z2xlIC8gQ2hyb21pdW0gT1MKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
