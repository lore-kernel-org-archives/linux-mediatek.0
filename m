From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [SPAM][PATCH v3 0/2] PCI: mediatek: enable whole MMIO range and
 enlarge the PCIe2AHB window size
Date: Tue, 12 Feb 2019 11:32:15 +0800
Message-ID: <1549942335.15284.1.camel@mtkswgap22>
References: <1548999367-11733-1-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548999367-11733-1-git-send-email-honghui.zhang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Honghui Zhang =?UTF-8?Q?=28=E5=BC=A0=E6=B4=AA=E8=BE=89=29?= <Honghui.Zhang@mediatek.com>
Cc: Youlin Pei =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?= <youlin.pei@mediatek.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "poza@codeaurora.org" <poza@codeaurora.org>, "fred@fredlawl.com" <fred@fredlawl.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jianjun Wang =?UTF-8?Q?=28=E7=8E=8B=E5=BB=BA=E5=86=9B=29?= <Jianjun.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

T24gRnJpLCAyMDE5LTAyLTAxIGF0IDEzOjM2ICswODAwLCBIb25naHVpIFpoYW5nICjlvKDmtKro
vokpIHdyb3RlOgo+IEZyb206IEhvbmdodWkgWmhhbmcgPGhvbmdodWkuemhhbmdAbWVkaWF0ZWsu
Y29tPgo+IAo+IFR3byBwYXRjaGVzOgo+IHBhdGNoIDEgZW5hYmxlIHdob2xlIE1NSU8gcmFuZ2Ug
d2hpY2ggYWxzbyBmaXggdGhlIGNvbXBsYWluIG9mIHNjcmlwdHMvY29jY2luZWxsZS9hcGkvcmVz
b3VyY2Vfc2l6ZS5jb2NjaQo+IHBhdGNoIDIgZW5sYXJnZSB0aGUgUENJZTJBSEIgd2luZG93IHNp
emUgdG8gc3VwcG9ydCBmdWxseSBhY2Nlc3Mgb2YgNEdCIERSQU0gZnJvbSBFUCBETUEuCj4gCj4g
djM6Cj4gIC0gdXBkYXRlIHRoZSBjaGFuZ2xvZyB0aXRsZSBmb3IgcGF0Y2gxIGFuZCB1cGRhdGUg
Y29tbWl0IG1lc3NhZ2UgZm9sbG93aW5nIEJqb3JuJ3Mgc3VnZ2VzdGlvbgo+ICAtIG1vdmUgdGhl
ICJ8IiBpbnRvIHRoZSBwcmV2aW91cyBsaW5lLgo+IAo+IHYyOgo+ICAtIEZpeCB0aGUgY2hlY2tw
YXRjaCBjb21wbGFpbnMgZm9yIHBhdGNoIDEuCj4gIC0gdXBkYXRlIHRoZSBjb21taXQgbWVzc2Fn
ZSBhbmQgY2hhbmdlIHRpdGxlIG9mIHBhdGNoIDEgZm9yIGNoYW5nZWxvZyBjb252ZW50aW9ucy4K
PiAgLSBBZGQgcGF0Y2ggMi4KPiAKPiBIb25naHVpIFpoYW5nICgyKToKPiAgIFBDSTogbWVkaWF0
ZWs6IEVuYWJsZSB0aGUgd2hvbGUgbWVtb3J5IG1hcHBlZCBJTyByYW5nZQo+ICAgUENJOiBtZWRp
YXRlazogRW5sYXJnZSBQQ0llMkFIQiB3aW5kb3cgc2l6ZSB0byBzdXBwb3J0IDRHQiBEUkFNCj4g
Cj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5jIHwgMTMgKysrKysrKysr
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
IAoKRm9yIHRoZSBzZXJpZXM6CgpBY2tlZC1ieTogUnlkZXIgTGVlIDxyeWRlci5sZWVAbWVkaWF0
ZWsuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwK
