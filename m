From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v8 6/9] drm/mediatek: add dsi interrupt control
Date: Tue, 13 Sep 2016 16:55:04 +0800
Message-ID: <1473756904.28437.32.camel@mtksdaap41>
References: <1473681672-47144-1-git-send-email-yt.shen@mediatek.com>
 <1473681672-47144-7-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1473681672-47144-7-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YT Shen <yt.shen@mediatek.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, yingjoe.chen@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGksIFlUOgoKT24gTW9uLCAyMDE2LTA5LTEyIGF0IDIwOjAxICswODAwLCBZVCBTaGVuIHdyb3Rl
Ogo+IEZyb206IHNoYW9taW5nIGNoZW4gPHNoYW9taW5nLmNoZW5AbWVkaWF0ZWsuY29tPgo+IAo+
IGFkZCBkc2kgaW50ZXJydXB0IGNvbnRyb2wKPiAKPiBTaWduZWQtb2ZmLWJ5OiBzaGFvbWluZyBj
aGVuIDxzaGFvbWluZy5jaGVuQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyB8IDc4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCj4gCgpbc25pcC4uLl0K
Cj4gIAo+ICtzdGF0aWMgdm9pZCBtdGtfZHNpX3NldF9pbnRlcnJ1cHRfZW5hYmxlKHN0cnVjdCBt
dGtfZHNpICpkc2kpCj4gK3sKPiArCXUzMiBpbnRlbiA9IERTSV9JTlRfQUxMX0JJVFM7Cj4gKwo+
ICsJaWYgKGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfVklERU8pCj4gKwkJaW50ZW4g
Jj0gfihURV9SRFlfSU5UX0ZMQUcgfCBFWFRfVEVfUkRZX0lOVF9GTEFHKTsKPiArCj4gKwl3cml0
ZWwoaW50ZW4sIGRzaS0+cmVncyArIERTSV9JTlRFTik7Cj4gK30KPiArCgpbc25pcC4uLl0KCj4g
Kwo+ICtzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX2RzaV9pcnEoaW50IGlycSwgdm9pZCAqZGV2X2lk
KQo+ICt7Cj4gKwlzdHJ1Y3QgbXRrX2RzaSAqZHNpID0gZGV2X2lkOwo+ICsJdTMyIHN0YXR1cywg
dG1wOwo+ICsJdTMyIGZsYWcgPSBMUFJYX1JEX1JEWV9JTlRfRkxBRyB8IENNRF9ET05FX0lOVF9G
TEFHIHwgVk1fRE9ORV9JTlRfRkxBRzsKCldoeSBkbyB5b3Ugb25seSBwcm9jZXNzIHRoZXNlIHRo
cmVlIGlycT8gWW91IGFsc28gZW5hYmxlIFRFX1JEWV9JTlRfRkxBRwomIEVYVF9URV9SRFlfSU5U
X0ZMQUcgaW4gbXRrX2RzaV9zZXRfaW50ZXJydXB0X2VuYWJsZSgpLiBQcm9jZXNzIHRoZXNlCnR3
byBpcnEgaGVyZSBvciBub3QgZW5hYmxlIHRoZW0gaW4gbXRrX2RzaV9zZXRfaW50ZXJydXB0X2Vu
YWJsZSgpLgoKUmVnYXJkcywKQ0sKCj4gKwo+ICsJc3RhdHVzID0gcmVhZGwoZHNpLT5yZWdzICsg
RFNJX0lOVFNUQSkgJiBmbGFnOwo+ICsKPiArCWlmIChzdGF0dXMpIHsKPiArCQlkbyB7Cj4gKwkJ
CW10a19kc2lfbWFzayhkc2ksIERTSV9SQUNLLCBSQUNLLCBSQUNLKTsKPiArCQkJdG1wID0gcmVh
ZGwoZHNpLT5yZWdzICsgRFNJX0lOVFNUQSk7Cj4gKwkJfSB3aGlsZSAodG1wICYgRFNJX0JVU1kp
Owo+ICsKPiArCQltdGtfZHNpX21hc2soZHNpLCBEU0lfSU5UU1RBLCBzdGF0dXMsIDApOwo+ICsJ
CW10a19kc2lfaXJxX2RhdGFfc2V0KGRzaSwgc3RhdHVzKTsKPiArCQl3YWtlX3VwX2ludGVycnVw
dGlibGUoJmRzaS0+aXJxX3dhaXRfcXVldWUpOwo+ICsJfQo+ICsKPiArCXJldHVybiBJUlFfSEFO
RExFRDsKPiArfQo+ICsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
