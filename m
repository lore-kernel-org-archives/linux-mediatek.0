From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [RFC/RFT usb-next v1 5/6] usb: chipidea: do not set the "phy"
 field in struct usb_hcd
Date: Mon, 5 Feb 2018 07:25:04 +0000
Message-ID: <HE1PR04MB14507B90AB9331F1D682CBD48BFE0@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <20180125001639.14681-1-martin.blumenstingl@googlemail.com>
 <20180125001639.14681-6-martin.blumenstingl@googlemail.com>
 <HE1PR04MB145071FCFAF041E0A9252FF08BE00@HE1PR04MB1450.eurprd04.prod.outlook.com>
 <CAFBinCCzghJxHe-1Jzwa1ohHYYytn53QAsXYue229dVu7tB7UQ@mail.gmail.com>
 <HE1PR04MB14504462F7C7A247E1CF9F308BE50@HE1PR04MB1450.eurprd04.prod.outlook.com>
 <CAFBinCC_GN7UKQZseLdyVcOsfCMfsvcdC92tRx=jBe68HO+B+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCC_GN7UKQZseLdyVcOsfCMfsvcdC92tRx=jBe68HO+B+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org" <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org" <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, "mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

IA0KPiA+IE1hcnRpbiwgeW91IGRlc2lnbiBoYXMgbm8gcHJvYmxlbSBmb3IgbW9zdCBvZiBjYXNl
cywgYnV0IHNvbWUgaGFyZHdhcmUNCj4gPiBuZWVkcyBzcGVjaWFsIHNlcXVlbmNlIGZvciBwaHkg
Y29udHJvbC4gSSB3aWxsIGdpdmUgYW4gZXhhbXBsZSBiZWxvdy4NCj4gZ3JlYXQgdG8gaGVhciB0
aGF0IHRoaXMgc2hvdWxkIHdvcmsgZm9yIG1vc3QgZGV2aWNlcyENCj4gDQo+ID4+IGl0IHdvdWxk
IGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBleHBsYWluIHRoZSBpc3N1ZSBiZWhpbmQgdGhpcyAoYW5k
DQo+ID4+IHRoZXJlYnkgYW5zd2VyIHRoZQ0KPiA+PiBxdWVzdGlvbjogd2h5IHdlIHdvdWxkIG5v
dCB3YW50IHRoZSBIQ0QgY29yZSB0byBtYW5hZ2UgdGhlIFBIWSBzdGF0ZXMpIQ0KPiA+Pg0KPiA+
Pg0KPiA+IEVnLCB0YWtpbmcgUXVhbGNvbW0gVVNCMiBjb250cm9sbGVyIGFzIGFuIGV4YW1wbGUs
IGl0IGV2ZW4gZG9lcyBub3QNCj4gPiBhbGxvdyBjaGlwaWRlYSBjb3JlIHRvIG1hbmFnZSBpdHMg
cG93ZXIgb3BlcmF0aW9uLCBzZWUNCj4gPiBDSV9IRFJDX09WRVJSSURFX1BIWV9DT05UUk9MIGF0
IGNoaXBpZGVhIGRyaXZlciAodXNiL2NoaXBpZGVhL2NvcmUuYykuDQo+IEl0cyBwaHlfcG93ZXJf
b24gaXMgY2FsbGVkIGFmdGVyIGVoY2kgY29udHJvbGxlciByZXNldCBoYXMgZmluaXNoZWQuDQo+
ID4gKHVzYi9jaGlwaWRlYS9jaV9oZHJjX21zbS5jKS4NCj4gSSBzZWUsIHRoYW5rIHlvdSBmb3Ig
ZXhwbGFpbmluZyB0aGlzIQ0KPiANCj4gd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgcmVwbGFjaW5n
IHRoZSB0d28gZm9sbG93aW5nIGZpZWxkcyBmcm9tIHN0cnVjdCB1c2JfaGNkOg0KPiAgIHN0cnVj
dCB1c2JfcGh5ICp1c2JfcGh5Ow0KPiAgIHN0cnVjdCBwaHkgKnBoeTsNCj4gd2l0aDoNCj4gICAv
Kg0KPiAgICAqIGRvIG5vdCBtYW5hZ2UgdGhlIFBIWSBzdGF0ZSBpbiB0aGUgSENEIGNvcmUsIGlu
c3RlYWQgbGV0IHRoZSBkcml2ZXIgaGFuZGxlDQo+ICAgICogdGhpcyAoZm9yIGV4YW1wbGUgaWYg
dGhlIFBIWSBjYW4gb25seSBiZSB0dXJuZWQgb24gYWZ0ZXIgYSBzcGVjaWZpYyBldmVudCkNCj4g
ICAgKi8NCj4gICBib29sIHNraXBfcGh5X2luaXRpYWxpemF0aW9uOw0KPiANCj4gbWF5YmUgSSBz
aG91bGQgYWxzbyBkbyB0aGlzIHRvZ2V0aGVyIHdpdGggbXkgb3RoZXIgc2VyaWVzIHdoaWNoIGFk
ZHMgdGhlIFBIWQ0KPiB3cmFwcGVyIHRvIHRoZSBIQ0QgY29yZSAob3IgZXZlbiBhcyBhIHNlcGFy
YXRlIHNlcmllcywgd2hpY2ggd291bGQgYmUgbWVyZ2VkDQo+IGJlZm9yZSB0aGlzIGFuZCB0aGUg
UEhZIHdyYXBwZXIgc2VyaWVzKS4gd2hhdCBkbyB5b3UgdGhpbms/DQo+IA0KPiANCiANCkhpIE1h
cnRpbiwNCg0KSSB0aGluayBpdCBpcyBiZXR0ZXIgdG8gZG8gdGhpcyBpbiBvbmUgc2VyaWVzLg0K
DQpQZXRlcg0KDQo=
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
