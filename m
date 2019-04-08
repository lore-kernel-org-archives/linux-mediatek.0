From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH 3/5] mt76: fix a leaked reference by adding a
 missingof_node_put
Date: Mon, 8 Apr 2019 09:37:24 +0200
Message-ID: <63a3b39a-0b01-f224-3c1c-d142519b7dd7@web.de>
References: <201904081455561126540@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201904081455561126540@zte.com.cn>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wen Yang <wen.yang99@zte.com.cn>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, UNGLinuxDriver@microchip.com, Matthias Brugger <matthias.bgg@gmail.com>, Anirudha Sarangi <anirudh@xilinx.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, John Linn <John.Linn@xilinx.com>, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
List-Id: linux-mediatek@lists.infradead.org

Pj4+IEBAIC01NCwyMiArNTQsMzAgQEAgIG10NzZfZ2V0X29mX2VlcHJvbShzdHJ1Y3QgbXQ3Nl9k
ZXYgKmRldiwgaW50IGxlbikKPj4+ICAgICAgICAgIHBhcnQgPSBucC0+bmFtZTsKPj4+Cj4+PiAg
ICAgIG10ZCA9IGdldF9tdGRfZGV2aWNlX25tKHBhcnQpOwo+PiDigKYKPj4+ICsgICAgaWYgKHJl
dGxlbiA8IGxlbikgewo+Pj4gKyAgICAgICAgcmV0ID0gLUVJTlZBTDsKPj4+ICsgICAgICAgIGdv
dG8gb3V0X3B1dF9ub2RlOwo+Pgo+PiBJIGZpbmQgYSBqdW1wIHRvIGFuIGltbWVkaWF0ZWx5IGZv
bGxvd2luZyBzb3VyY2UgY29kZSBwbGFjZSB1bm5lY2Vzc2FyeS4KPj4gV291bGQgeW91IGxpa2Ug
dG8gZGVsZXRlIGl0Pwo+Pgo+Pgo+Pj4gKyAgICB9Cj4+Pgo+Pj4gLSAgICByZXR1cm4gMDsKPj4+
ICtvdXRfcHV0X25vZGU6Cj4+PiArICAgIG9mX25vZGVfcHV0KG5wKTsKPj4+ICsgICAgcmV0dXJu
IHJldDsKPj4+ICAjZWxzZQo+Pgo+PiBDYW4gYW5vdGhlciBiaXQgb2YgZmluZS10dW5pbmcgbWF0
dGVyIGhlcmU/Cj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L25leHQvbGludXgtbmV4dC5naXQvdHJlZS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRl
ay9tdDc2L2VlcHJvbS5jP2lkPTM0ZTAyMmQ4Yjc4MGEwMzkwMmQ4MmZiMzk5N2JhN2M3YjFmNDBj
ODEjbjczCuKApgo+IFdlIG1heSBoYXZlIHNvbWUgZGlmZmVyZW50IG9waW5pb25zIGhlcmUuCgpP
YnZpb3VzbHksIHllcyBmb3IgdGhpcyBpbXBsZW1lbnRhdGlvbiBkZXRhaWwuCgoKPiBEZWxldGlu
ZyB0aGUgZ290byBzdGF0ZW1lbnQgbWF5IG5vdCBiZSBnb29kLgoKSSBmaW5kIHN1Y2ggYW4gYWRq
dXN0bWVudCBoZWxwZnVsIGhlcmUuCgoKPiBJZiB0aGUgY29kZSBmdXJ0aGVyIHVwIGlzIGNoYW5n
ZWQgaXQncyBlYXN5IGVub3VnaCB0byBtaXNzCj4gdGhhdCBhIGdvdG8gc3RhdGVtZW50IG5lZWRz
IHRvIGJlIGFkZGVkIGhlcmUuCgpUaGVyZSBhcmUgdGhlIHVzdWFsIGNvbnNlcXVlbmNlcyB0byBj
b25zaWRlciBmb3IgZXZlcnkgY2hhbmdlLgoKCj4gQmV0dGVyIHRvIHNldCByZXQgdG8gemVybyBl
eHBsaWNpdGx5LCB0aGlzIGlzIHRoZSBzdWNjZXNzIHBhdGggYWZ0ZXIgYWxsLgoKSSBkaXNhZ3Jl
ZSB0byB0aGlzIGluZm9ybWF0aW9uIGJlY2F1c2UgdGhlIHZhcmlhYmxlIHdhcyBzZXQgdG8KdGhl
IHJldHVybiB2YWx1ZSBmcm9tIGEgY2FsbCBvZiB0aGUgZnVuY3Rpb24g4oCcbXRkX3JlYWTigJ0g
YWxyZWFkeS4KClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
