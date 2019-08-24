From: Frank Wunderlich <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
Subject: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from
 core driver
Date: Sat, 24 Aug 2019 09:04:36 +0200
Message-ID: <725410A8-8B5B-472A-8904-57B912475783@public-files.de>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11>
 <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
 <0A87F427-2D81-412A-9549-09A51A021799@public-files.de>
 <b5a21908-faee-17d1-ce26-99b941c0fa70@gmail.com>
Reply-To: frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <b5a21908-faee-17d1-ce26-99b941c0fa70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

SGkKCldpZSBrb21tdCBlcyxkYXNzIGRlciBQYXRjaCBzbyBzY2huZWxsIGluIG5leHQgZ2Vrb21t
ZW4gaXN0PyBJY2ggdmVyc3VjaGUgamEgc2VsYnN0IGRlbiBwb3dlcm9mZiByZWluIHp1IGJla29t
bWVuLGFiZXIgaWNoIHZlcm11dGUgZGFzcyBzaWNoIGRpZSBiZWlkZW4gc2VyaWVuIGdlZ2Vuc2Vp
dGlnIHN0w7ZyZW4uCgpGZWhsZW4gdm9uIGRlciBzZXJpZSBub2NoIG1laHIgcGF0Y2hlcyBvZGVy
IGZsaWVndCBlciB2aWVsbGVpY2h0IHdpZWRlciByYXVzPwoKV2VubiBpY2ggZGFzIHdlaXMga2Fu
biBpY2ggbWVpbmUgcG93ZXJvZmYtUGF0Y2hlcyBzY2hvbm1hbCBhdWYgbmV4dCBhbnBhc3NlbgoK
R3J1w58gRnJhbmsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
