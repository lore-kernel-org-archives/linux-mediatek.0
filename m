From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] mt76: Fix comparisons with invalid hardware key index
Date: Fri, 31 Aug 2018 15:52:48 +0000 (UTC)
Message-ID: <20180831155248.D7F8D607F7@smtp.codeaurora.org>
References: <20180823212738.18431-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180823212738.18431-1-geert@linux-m68k.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cgo+IFdpdGgg
Z2NjIDQuMS4yOgo+IAo+ICAgICBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210
NzZ4MC90eC5jOiBJbiBmdW5jdGlvbiDigJhtdDc2eDBfdHjigJk6Cj4gICAgIGRyaXZlcnMvbmV0
L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NngwL3R4LmM6MTY5OiB3YXJuaW5nOiBjb21wYXJp
c29uIGlzIGFsd2F5cyB0cnVlIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9mIGRhdGEgdHlwZQo+ICAg
ICBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzZ4Ml90eF9jb21tb24uYzog
SW4gZnVuY3Rpb24g4oCYbXQ3NngyX3R44oCZOgo+ICAgICBkcml2ZXJzL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2L210NzZ4Ml90eF9jb21tb24uYzozNTogd2FybmluZzogY29tcGFyaXNvbiBp
cyBhbHdheXMgdHJ1ZSBkdWUgdG8gbGltaXRlZCByYW5nZSBvZiBkYXRhIHR5cGUKPiAKPiBXaGls
ZSBhc3NpZ25pbmcgLTEgdG8gYSB1OCB3b3JrcyBmaW5lLCBjb21wYXJpbmcgd2l0aCAtMSBkb2Vz
IG5vdCB3b3JrCj4gYXMgZXhwZWN0ZWQuCj4gCj4gRml4IHRoaXMgYnkgY29tcGFyaW5nIHdpdGgg
MHhmZiwgbGlrZSBpcyBhbHJlYWR5IGRvbmUgaW4gc29tZSBvdGhlcgo+IHBsYWNlcy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgoK
UGF0Y2ggYXBwbGllZCB0byB3aXJlbGVzcy1kcml2ZXJzLW5leHQuZ2l0LCB0aGFua3MuCgo4MWM4
ZWNjYzI0MDQgbXQ3NjogRml4IGNvbXBhcmlzb25zIHdpdGggaW52YWxpZCBoYXJkd2FyZSBrZXkg
aW5kZXgKCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNTc0NTgzLwoK
aHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0
aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
