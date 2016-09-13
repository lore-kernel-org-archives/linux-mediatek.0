From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 8/9] drm/mediatek: update DSI sub driver flow
Date: Tue, 13 Sep 2016 17:59:34 +0800
Message-ID: <1473760774.28437.53.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
 <1472815484-43821-9-git-send-email-yt.shen@mediatek.com>
 <1473224283.11736.27.camel@mtksdaap41>
 <1473675347.12398.24.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1473675347.12398.24.camel@mtksdaap41>
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

SGksIFlUOgoKT24gTW9uLCAyMDE2LTA5LTEyIGF0IDE4OjE1ICswODAwLCBZVCBTaGVuIHdyb3Rl
Ogo+IEhpIENLLAo+IAo+IE9uIFdlZCwgMjAxNi0wOS0wNyBhdCAxMjo1OCArMDgwMCwgQ0sgSHUg
d3JvdGU6Cj4gPiBIaSwgWVQ6Cj4gPiAKPiA+IE9uIEZyaSwgMjAxNi0wOS0wMiBhdCAxOToyNCAr
MDgwMCwgWVQgU2hlbiB3cm90ZToKPiA+ID4gVGhpcyBwYXRjaCB1cGRhdGUgZW5hYmxlL2Rpc2Fi
bGUgZmxvdyBvZiBEU0kgbW9kdWxlIGFuZCBNSVBJIFRYIG1vZHVsZQo+ID4gPiAKPiA+ID4gU2ln
bmVkLW9mZi1ieTogc2hhb21pbmcgY2hlbiA8c2hhb21pbmcuY2hlbkBtZWRpYXRlay5jb20+Cj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFlUIFNoZW4gPHl0LnNoZW5AbWVkaWF0ZWsuY29tPgo+ID4gPiAt
LS0KPiA+IAo+ID4gSSB0aGluayB0aGUgZGVzY3JpcHRpb24gaXMgdG9vIHNpbXBsZS4gUGxlYXNl
IGJyaWVmbHkgZGVzY3JpYmUgV0hZIG9mCj4gPiB0aGlzIHBhdGNoLiBUaGUgb3JpZ2luYWwgZW5h
YmxlL2Rpc2FibGUgZmxvdyBpcyB3b3JrYWJsZSwgc28gd2h5IGRvIHlvdQo+ID4gbmVlZCB0aGlz
IHBhdGNoPyBXaXRob3V0IHRoaXMgcGF0Y2gsIHdoYXQgcHJvYmxlbSB3b3VsZCBoYXBwZW4/Cj4g
R290IGl0LCB3ZSB3aWxsIHVwZGF0ZSBtb3JlIGRlc2NyaXB0aW9ucyBpbiB0aGUgbmV4dCB2ZXJz
aW9uLgo+IFRoZXJlIGlzIG5vIHRyYW5zZmVyL2ludGVycnVwdCBmdW5jdGlvbiBpbiB0aGUgdXBz
dHJlYW0gRFNJIGRyaXZlci4KPiBXZSBhbHNvIGltcGxlbWVudCB0aGUgZm9sbG93aW5nIGZ1bmN0
aW9uIFsxXVsyXSBpbiB0aGlzIHBhdGNoIHNlcmllcy4KPiAKPiBPcmlnaW5hbCBmbG93IHdvcmtz
IG9uIHRoZXJlIGlzIGEgYnJpZGdlIGNoaXA6IERTSSAtPiBicmlkZ2UgLT4gcGFuZWwuCj4gSW4g
dGhpcyBjYXNlOiBEU0kgLT4gcGFuZWwsIHRoZSBEU0kgc3ViIGRyaXZlciBmbG93IHNob3VsZCBi
ZSB1cGRhdGVkLgo+IFdlIG5lZWQgdG8gaW5pdGlhbGl6ZSBEU0kgZmlyc3Qgc28gdGhhdCB3ZSBj
YW4gc2VuZCBjb21tYW5kcyB0byBwYW5lbC4KPiAKPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC85MzEwODE5Lwo+IGRybS9tZWRpYXRlazogYWRkIGRzaSBpbnRlcnJ1cHQg
Y29udHJvbAo+IFsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzkzMTA4MjMv
Cj4gZHJtL21lZGlhdGVrOiBhZGQgZHNpIHRyYW5zZmVyIGZ1bmN0aW9uCj4gCgpJIHN1Z2dlc3Qg
eW91IHRvIHNlcGFyYXRlICJEU0kgZGlyZWN0bHkgY29ubmVjdCB0byBwYW5lbCIgcmVsYXRlZApw
YXRjaGVzIHRvIGFub3RoZXIgc2VyaWVzIGJlY2F1c2UgTVQ4MTczIGNvdWxkIGFsc28gYXBwbHkg
aXQgYW5kIGl0IGlzCm5vdCBlc3NlbnRpYWwgZm9yIE1UMjcwMSBpZiBNVDI3MDEgdXNlIGJyaWRn
ZSBJQyBmb3IgZHNpLgoKUmVnYXJkcywKQ0sKCj4gPiAKPiA+IFJlZ2FyZHMsCj4gPiBDSwo+ID4g
Cj4gPiAKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
