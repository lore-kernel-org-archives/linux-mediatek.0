From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] drm/bridge: add it6505 driver
Date: Thu, 12 Sep 2019 14:05:27 -0700
Message-ID: <20190912210526.GA16171@roeck-us.net>
References: <1567507915-9844-1-git-send-email-allen.chen@ite.com.tw>
 <1567507915-9844-3-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1567507915-9844-3-git-send-email-allen.chen@ite.com.tw>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: allen <allen.chen@ite.com.tw>
Cc: Archit Taneja <architt@codeaurora.org>, Jitao Shi <jitao.shi@mediatek.com>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, Yilun Lin <yllin@google.com>, David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

SGksCgpPbiBUdWUsIFNlcCAwMywgMjAxOSBhdCAwNjo1MTo1NFBNICswODAwLCBhbGxlbiB3cm90
ZToKPiBGcm9tOiBBbGxlbiBDaGVuIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+Cj4gCj4gVGhpcyBh
ZGRzIHN1cHBvcnQgZm9yIHRoZSBpVEUgSVQ2NTA1Lgo+IFRoaXMgZGV2aWNlIGNhbiBjb252ZXJ0
IERQSSBzaWduYWwgdG8gRFAgb3V0cHV0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8
aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZaWx1biBMaW4gPHlsbGlu
QGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUu
Y29tLnR3PgoKSSB0cmllZCB0byBwcm92aWRlIGZlZWRiYWNrIG9uIHRoaXMgcGF0Y2gsIGJ1dCBp
dCBpcyBmYXIgZnJvbSBjb21waWxpbmcKYWdhaW5zdCB0aGUgdXBzdHJlYW0ga2VybmVsIChvciAt
bmV4dCksIGFuZCBpdCBoYXMgYSBudW1iZXIgb2Ygb2J2aW91cwpwcm9ibGVtcyBzdWNoIGFzIG1p
c3NpbmcgaW5jbHVkZSBmaWxlcywgdmFyaWFibGUgdHlwZSBtaXNtYXRjaGVzLCBhbmQKc2V0IGJ1
dCB1bnVzZWQgdmFyaWFibGVzLiBJdCBkb2VzIGNvbXBpbGUgYWdhaW5zdCB2NC4xOS55LCBidXQg
ZXZlbiB0aGVyZQppdCBnZW5lcmF0ZXMgYSBudW1iZXIgb2YgYnVpbGQgd2FybmluZ3MuCgpJIHdv
dWxkIHN1Z2dlc3QgdG8gZml4IHRob3NlIHByb2JsZW1zIGFuZCB0byBtYWtlIHN1cmUgdGhhdCB0
aGUgZHJpdmVyCmJ1aWxkcyB3aXRob3V0IHdhcm5pbmdzIG9uIHRvcCBvZiB0aGUgbWFpbmxpbmUg
a2VybmVsIGJlZm9yZSByZXN1Ym1pdHRpbmcuCgpUaGFua3MsCkd1ZW50ZXIKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
