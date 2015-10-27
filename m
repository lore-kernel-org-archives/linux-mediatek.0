From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] clockevents/drivers/mtk: Fix spurious interrupt
 leading to crash
Date: Tue, 27 Oct 2015 12:23:20 +0100
Message-ID: <562F5EA8.2070507@linaro.org>
References: <1440426924.17418.11.camel@mtksdaap41>
 <1440453450-21203-1-git-send-email-daniel.lezcano@linaro.org>
 <1440508871.29634.1.camel@mtksdaap41> <55DDCC4B.7010203@linaro.org>
 <562F5BE9.30200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <562F5BE9.30200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, catalin.marinas-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "open list:CLOCKSOURCE,
 CLOC..." <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

T24gMTAvMjcvMjAxNSAxMjoxMSBQTSwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiBIaSBEYW5p
ZWwsCj4KPiBPbiAyNi8wOC8xNSAxNjoyNSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+IE9uIDA4
LzI1LzIwMTUgMDM6MjEgUE0sIFlpbmdqb2UgQ2hlbiB3cm90ZToKPj4+IFRlc3RlZC1ieTogWWlu
Z2pvZSBDaGVuPHlpbmdqb2UuY2hlbkBtZWRpYXRlay5jb20+Cj4+Cj4+IEFwcGxpZWQgdG8gbXkg
dHJlZSBmb3IgNC40Lgo+Pgo+PiAgICAtLSBEYW5pZWwKPj4KPgo+IEtldmluIGZvdW5kIGEgcmVn
cmVzc2lvbiBpbiB2NC4zIHdoaWNoIHdpbGwgbmVlZCB0aGlzIHBhdGNoIHRvIGZpeCBpdAo+IFsx
XS4gQ2FuIHlvdSBhcHBseSBpdCB0byB5b3VyIGNsb2NrZXZlbnRzLzQuMy1maXhlcyBicmFuY2gg
cGxlYXNlLgo+Cj4gVGhhbmtzLAo+IE1hdHRoaWFzCj4KPiBbMV0gaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTUvMTAvMjYvMjExCgpIbW0sIEkgdGhvdWdodCBpdCB3YXNuJ3QgaW1wYWN0aW5nIDQu
Mywgc28gaXQgd2VudCB0byA0LjQuCgpMZXQgbWUgbG9vayBob3cgdG8gYmFja3BvcnQgdGhpcyBm
aXggd2l0aG91dCBpbnRyb2R1Y2luZyBhIGNvbmZsaWN0IHdoZW4gCnRpcC90aW1lcnMvdXJnZW50
IHdpbGwgYmUgbWVyZ2VkIHRvIHRpcC90aW1lcnMvY29yZS4KCi0tIAogIDxodHRwOi8vd3d3Lmxp
bmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJv
PiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwK
PGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
