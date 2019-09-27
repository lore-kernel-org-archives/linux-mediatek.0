From: Jingoo Han <jingoohan1@gmail.com>
Subject: Re: [PATCH 06/11] PCI: of: Add inbound resource parsing to helpers
Date: Fri, 27 Sep 2019 16:12:27 +0000
Message-ID: <SL2P216MB0105EF7D414AE054835D25C9AA810@SL2P216MB0105.KORP216.PROD.OUTLOOK.COM>
References: <20190924214630.12817-1-robh@kernel.org>
 <20190924214630.12817-7-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190924214630.12817-7-robh@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Linus Walleij <linus.walleij@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Michal Simek <michal.simek@xilinx.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Simon Horman <horms@verge.net.au>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, rfi@lists.rocketboar
List-Id: linux-mediatek@lists.infradead.org

DQoNCu+7vz4gT24gOS8yNC8xOSwgNTo0NiBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+DQo+IEV4
dGVuZCBkZXZtX29mX3BjaV9nZXRfaG9zdF9icmlkZ2VfcmVzb3VyY2VzKCkgYW5kDQo+IHBjaV9w
YXJzZV9yZXF1ZXN0X29mX3BjaV9yYW5nZXMoKSBoZWxwZXJzIHRvIGFsc28gcGFyc2UgdGhlIGlu
Ym91bmQNCj4gYWRkcmVzc2VzIGZyb20gRFQgJ2RtYS1yYW5nZXMnIGFuZCBwb3B1bGF0ZSBhIHJl
c291cmNlIGxpc3Qgd2l0aCB0aGUNCj4gdHJhbnNsYXRlZCBhZGRyZXNzZXMuIFRoaXMgd2lsbCBo
ZWxwIGVuc3VyZSAnZG1hLXJhbmdlcycgaXMgYWx3YXlzDQo+IHBhcnNlZCBpbiBhIGNvbnNpc3Rl
bnQgd2F5Lg0KPg0KPiBDYzogSmluZ29vIEhhbiA8amluZ29vaGFuMUBnbWFpbC5jb20+DQoNCkZv
ciAvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYywNCg0K
QWNrZWQtYnk6IEppbmdvbyBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpKaW5nb28gSGFuDQoNCj4gQ2M6IEd1c3Rhdm8gUGltZW50ZWwgPGd1c3Rhdm8ucGltZW50
ZWxAc3lub3BzeXMuY29tPg0KPiBDYzogTG9yZW56byBQaWVyYWxpc2kgPGxvcmVuem8ucGllcmFs
aXNpQGFybS5jb20+DQo+IENjOiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPg0K
PiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4NCj4g
Q2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+DQo+IENjOiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IENjOiBUb2FuIExlIDx0b2FuQG9zLmFtcGVyZWNv
bXB1dGluZy5jb20+DQo+IENjOiBMZXkgRm9vbiBUYW4gPGxmdGFuQGFsdGVyYS5jb20+DQo+IENj
OiBUb20gSm9zZXBoIDx0am9zZXBoQGNhZGVuY2UuY29tPg0KPiBDYzogUmF5IEp1aSA8cmp1aUBi
cm9hZGNvbS5jb20+DQo+IENjOiBTY290dCBCcmFuZGVuIDxzYnJhbmRlbkBicm9hZGNvbS5jb20+
DQo+IENjOiBiY20ta2VybmVsLWZlZWRiYWNrLWxpc3RAYnJvYWRjb20uY29tDQo+IENjOiBSeWRl
ciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+DQo+IENjOiBLYXJ0aGlrZXlhbiBNaXRyYW4g
PG0ua2FydGhpa2V5YW5AbW9iaXZlaWwuY28uaW4+DQo+IENjOiBIb3UgWmhpcWlhbmcgPFpoaXFp
YW5nLkhvdUBueHAuY29tPg0KPiBDYzogU2ltb24gSG9ybWFuIDxob3Jtc0B2ZXJnZS5uZXQuYXU+
DQo+IENjOiBTaGF3biBMaW4gPHNoYXduLmxpbkByb2NrLWNoaXBzLmNvbT4NCj4gQ2M6IEhlaWtv
IFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+DQo+IENjOiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5z
aW1la0B4aWxpbnguY29tPg0KPiBDYzogcmZpQGxpc3RzLnJvY2tldGJvYXJkcy5vcmcNCj4gQ2M6
IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IGxpbnV4LXJlbmVzYXMt
c29jQHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFk
Lm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiAt
LS0NCj4gIC4uLi9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYyB8ICAz
ICstDQoNCi4uLi4NCg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1kZXNpZ253YXJlLWhvc3QuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
ZGVzaWdud2FyZS1ob3N0LmMNCj4gaW5kZXggZjkzMjUyZDBkYTViLi4wNzQzYWU2NGJiMGYgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1o
b3N0LmMNCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJl
LWhvc3QuYw0KPiBAQCAtMzQyLDcgKzM0Miw4IEBAIGludCBkd19wY2llX2hvc3RfaW5pdChzdHJ1
Y3QgcGNpZV9wb3J0ICpwcCkNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICANCj4gIAlyZXQgPSBk
ZXZtX29mX3BjaV9nZXRfaG9zdF9icmlkZ2VfcmVzb3VyY2VzKGRldiwgMCwgMHhmZiwNCj4gLQkJ
CQkJJmJyaWRnZS0+d2luZG93cywgJnBwLT5pb19iYXNlKTsNCj4gKwkJCQkJJmJyaWRnZS0+d2lu
ZG93cywgJmJyaWRnZS0+ZG1hX3JhbmdlcywNCj4gKwkJCQkJJnBwLT5pb19iYXNlKTsNCj4gIAlp
ZiAocmV0KQ0KPiAgCQlyZXR1cm4gcmV0Ow0KIA0KLi4uLg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QK
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
