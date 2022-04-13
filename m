Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDF3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 18:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9D/pTeQvp0DsO87swElSRQwmP2B5umdIdqsRJDfB7eg=; b=cGNko9+ytMNYwF
	L4nmzlirYcrPiBEHZ9EpgQQZoNZMm2R2eEqujWqzbEfajEd4Unu8TrG2JibwyiflK1ZjS9xswd8y5
	h2zsCSkYagAi+ivLHSkgAwQDnqwl/M1gKnIGEENzc6QyuVp77/FohnvT5R5mtuLjzBghIyTnLCJTj
	nZAcDPm7z8YJQFgFEg6ro3ny5pkfvyCf9cwGHFwVsjma4zHmv5lST4OYFsvD+JotQb49iPs0twU2U
	kKWOPGxkvs1qV93FFngu/XcWT7BVnpMmMn9u033qRI8y93ynzW33Qrapd4/2WNKa480uyW0WOmltz
	YVmlR+fgMRBZbJicKQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nehlD-0025r8-9J; Wed, 13 Apr 2022 18:30:35 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nehl0-0025mW-Vi
 for linux-mediatek@lists.infradead.org; Wed, 13 Apr 2022 18:30:24 +0000
Received: by mail-qt1-x82d.google.com with SMTP id hf18so1519850qtb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Apr 2022 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=oaw1H7ej+H/u4nXZZIRhEvfXMrTU7J9fBtaSDqIOS9E=;
 b=Tl0MNurF8gO6Y1umghsqtSsBJzR49HHmVF9eLSBm6kpPc2Z9QYhG8CIzCgS9FDWw0P
 pfP53xh63JNatbRx63EPky41tBSo4sWcC34iMbTFh5pABfGjSPgYz4GE36N9nu/w0xUu
 /A4jkv0/kqbTAy9A3F/itIl4ghG24mRQgG/KTjqkEqH27JVXFiEIgLs7h63Rnscj5cPF
 eAAHuN6pJMpOtM/8BMcGCKZzaaQnELvwYog9F+ggl7SNTafduw5ROr05f0tq8Amei4FZ
 H1T0yvOyjEXGra2cOsLJCkj3ZSr6YH8WFeYdZWVjtbr0foGtD/2wQIHMEbtHymqjLhUG
 6n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=oaw1H7ej+H/u4nXZZIRhEvfXMrTU7J9fBtaSDqIOS9E=;
 b=U++falp6Zp+gYdWqYFRTS9weVQN3HpzfEmH0OlZKzQ+szIQ1aWGQWhtmOOY62bpdhV
 0+z1CVzoNgnkGZ926roLVRgZ5HHA9xBRwIIHpJPEk2SzCwB02naBHHPbyWKOFv3C5Sf/
 dgT254rqHCMfZ1Ruq66TdPg9X8aZF1ydcZFYYvZre5TpES+Ohh+DGNr75sYaA/njCEi9
 C0VubajJYNDniy8OQBpJNTgoD2kIqi0eZDdIMKtUeLoAoU5dlZk/MivlqcrGuo5e/qsP
 OBZSyGK3ny75wVtbE2O6qL7+ektkoiGh01+TcgLypAbijtHoJ1NqW5H97XJIPcl5BXxr
 aJKg==
X-Gm-Message-State: AOAM533XM8rvFBz7m2wBZ6a2b/FnAgXEf0fU0gQ9Mrrxsq77vGkMjG3T
 YArtQI7RS9SiqCPck/eh8upkHA==
X-Google-Smtp-Source: ABdhPJxREgfBX2pCsyX7ZwxQHAa4ijGVIJdD+d2SJEIQwKzRhChdCAVqhwPzb/7CrsUhX+8LDkNB/w==
X-Received: by 2002:ac8:44c1:0:b0:2ed:f66:804a with SMTP id
 b1-20020ac844c1000000b002ed0f66804amr8113774qto.102.1649874618218; 
 Wed, 13 Apr 2022 11:30:18 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 22-20020ac85756000000b002e1cabad999sm30464060qtx.89.2022.04.13.11.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 11:30:16 -0700 (PDT)
Message-ID: <2031e84425f0aa8df03328057c394551c30a38f5.camel@ndufresne.ca>
Subject: Re: [PATCH v8, 00/15] media: mtk-vcodec: support for M8192 decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>, "yunfei.dong@mediatek.com"
 <yunfei.dong@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,  dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 13 Apr 2022 14:30:15 -0400
In-Reply-To: <1d9a6259-b1f6-5c4f-7e91-0529b77b6a44@collabora.com>
References: <20220331024801.29229-1-yunfei.dong@mediatek.com>
 <fbfe4572296a133492310f13e3f41db56218fc17.camel@ndufresne.ca>
 <0f385e6e2d0687c3e6de12a576d1617af9504cee.camel@mediatek.com>
 <c5dc9f759054418082849233639f727e39329550.camel@ndufresne.ca>
 <cdcaf769ee162658e3bbb0c30bb8c4cbb168c6d6.camel@mediatek.com>
 <1d9a6259-b1f6-5c4f-7e91-0529b77b6a44@collabora.com>
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_113023_077290_7B8D9AED 
X-CRM114-Status: GOOD (  40.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGUgbWVyY3JlZGkgMTMgYXZyaWwgMjAyMiDDoCAwOTo1NyArMDIwMCwgQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gYSDDqWNyaXTCoDoKPiBJbCAxMy8wNC8yMiAwOTowMywgYWxsZW4ta2guY2hl
bmcgaGEgc2NyaXR0bzoKPiA+IEhpIE5pY29sYXMsCj4gPiAKPiA+IE9uIFR1ZSwgMjAyMi0wNC0x
MiBhdCAxMDo0OCAtMDQwMCwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToKPiA+ID4gTGUgbHVuZGkg
MTEgYXZyaWwgMjAyMiDDoCAxMTo0MSArMDgwMCwgeXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tIGEK
PiA+ID4gw6ljcml0IDoKPiA+ID4gPiBIaSBOaWNvbGFzLAo+ID4gPiA+IAo+ID4gPiA+IE9uIFRo
dSwgMjAyMi0wMy0zMSBhdCAxNjo0OCAtMDQwMCwgTmljb2xhcyBEdWZyZXNuZSB3cm90ZToKPiA+
ID4gPiA+IEhpIFl1bmZlaSwKPiA+ID4gPiA+IAo+ID4gPiA+ID4gdGhhbmtzIGZvciB0aGUgdXBk
YXRlLCBJIHNob3VsZCBiZSB0ZXN0aW5nIHRoaXMgcmVhbGx5IHNvb24uCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IExlIGpldWRpIDMxIG1hcnMgMjAyMiDDoCAxMDo0NyArMDgwMCwgWXVuZmVpIERvbmcg
YSDDqWNyaXQgOgo+ID4gPiA+ID4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIG10ODE5
MiBoMjY0L3ZwOC92cDkgZGVjb2Rlcgo+ID4gPiA+ID4gPiBkcml2ZXJzLgo+ID4gPiA+ID4gPiBG
aXJzdGx5LCByZWZhY3Rvcgo+ID4gPiA+ID4gPiBwb3dlci9jbG9jay9pbnRlcnJ1cHQgaW50ZXJm
YWNlcyBmb3IgbXQ4MTkyIGlzIGxhdCBhbmQgY29yZQo+ID4gPiA+ID4gPiBhcmNoaXRlY3R1cmUu
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNpbWlsYXJseSB0byBNVDgxNzMgYW5kIE1UODE4MywgYSBz
aGFyZWQqIGZpcm13YXJlIGlzIG5lZWRlZCBmb3IKPiA+ID4gPiA+IHRoaXMKPiA+ID4gPiA+IENP
REVDIHRvCj4gPiA+ID4gPiB3b3JrIChzY3AuaW1nKS4gSSBsb29rZWQgaW50byBsaW51eC1maXJt
d2FyZVsxXSBpdCBoYXMgbm90IGJlZW4KPiA+ID4gPiA+IGFkZGVkCj4gPiA+ID4gPiBmb3IgbXQ4
MTkyCj4gPiA+ID4gPiB5ZXQuIEFzIHlvdXIgcGF0Y2hlcyBhcmUgZ2V0dGluZyBjbG9zZSB0byBi
ZSByZWFkeSwgaXQgd291bGQgYmUKPiA+ID4gPiA+IGltcG9ydGFudCB0bwo+ID4gPiA+ID4gbG9v
ayBpbnRvIHRoaXMgc28gdGhlIHBhdGNoc2V0IGRvZXMgbm90IGdldCBibG9ja2VkIGR1ZSB0byB0
aGF0Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBiZXN0IHJlZ2FyZHMsCj4gPiA+ID4gPiBOaWNvbGFz
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFsxXQo+ID4gPiA+ID4gCj4gPiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvZmlybXdhcmUvbGludXgtZmlybXdhcmUuZ2l0L3RyZWUvbWVkaWF0ZWtfXzshIUNUUk5LQTl3
TWcwQVJidyF6eTRONkpEcm9TWHR1bVhYYTdNdXhBZ1lBUEFpbms4dXlXLTk3OHZwV2N0OFMzdk9q
QnFYaXJGRTh1VEVIb3BIQ292YlNsMEZOUDlMUGdXQ0VCclpmTUljdlEkCj4gPiA+ID4gPiAgIAo+
ID4gPiA+ID4gKiBTaGFyZWQgYXQgbGVhc3QgYmV0d2VlbiBNRFAzIGFuZCBNVEsgVkNPREVDIGZy
b20gbXkga25vd2xlZGdlCj4gPiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBUaGFua3MgZm9yIHlv
dXIgcmVtaW5kLgo+ID4gPiA+IAo+ID4gPiA+IEkgaGF2ZSBhbHJlYWR5IHNlbnQgbXQ4MTkyIHNj
cC5pbWcgdG8gZ2l0aHViLgo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS95dW5mZWlkb25nbWVkaWF0ZWsvbGludXhfZndf
c2NwXzgxOTIvY29tbWl0LzNhYzJmYzg1YmM3ZGZjZWJkYjkyYjViNTgwOGIwMjY4Y2RmYjc3MmRf
XzshIUNUUk5LQTl3TWcwQVJidyF6eTRONkpEcm9TWHR1bVhYYTdNdXhBZ1lBUEFpbms4dXlXLTk3
OHZwV2N0OFMzdk9qQnFYaXJGRTh1VEVIb3BIQ292YlNsMEZOUDlMUGdXQ0VCcGY5Rl9uV0EkCj4g
PiA+ID4gICAKPiA+ID4gPiAKPiA+ID4gPiBXYWl0aW5nIGZvciB0byBiZSBtZXJnZWQuCj4gPiA+
IAo+ID4gPiBPbiBib2FyZHMgSSBoYXZlLCB0aGUgZmlybXdhcmUgaXMgbG9hZGVkIGZyb20gL2xp
Yi9maXJtd2FyZS9zY3AuaW1nLAo+ID4gPiBidXQgd2l0aAo+ID4gPiB0aGlzIHN1Ym1pc3Npb24g
aXQgd2lsbCBiZSBpbiBsaWIvZmlybXdhcmUvbWVkaWF0ZWsvbXQ4MTkyL3NjcC5pbWcgLgo+ID4g
PiBJIGhhdmVuJ3QKPiA+ID4gZm91bmQgYW55dGhpbmcgYXJvdW5kOgo+ID4gPiAKPiA+ID4gICBk
cml2ZXJzL3JlbW90ZXByb2MvbXRrX3NjcC5jOjgxMjogICAgICAgY2hhciAqZndfbmFtZSA9ICJz
Y3AuaW1nIjsKPiA+ID4gCj4gPiA+IFRoYXQgd291bGQgdXNlIHRoZSBwbGF0Zm9ybSBwYXRoLiBU
aGlzIHNlZW1zIGxpa2UgYSBwcm9ibGVtIHRvIG1lLAo+ID4gPiB0aGUKPiA+ID4gdXBzdHJlYW1p
bmcgb2YgdGhlIGZpcm13YXJlIGlzbid0IGJlaW5nIGFsaWduZWQgd2l0aCB0aGUgd2VyZSB0aGUK
PiA+ID4gZmlybXdhcmUgaXMKPiA+ID4gcGlja2VkIGJ5IHRoZSB1cHN0cmVhbSBkcml2ZXIuIENv
cnJlY3QgbWUgaWYgSSBnb3QgdGhpcyB3cm9uZywgYnV0Cj4gPiA+IEknZCByZWFsbHkKPiA+ID4g
bGlrZSB0byBjbGFyaWZ5IHRoaXMuCj4gPiA+IAo+ID4gPiBOaWNvbGFzCj4gPiA+IAo+ID4gCj4g
PiBJIGFtIG5vdCBzdXJlIHdoeSBpdCdzIGFjY2VwdGVkIHRoZSBmdyBwYXRoIG9mIHNjcCBpcwo+
ID4gL2xpYi9maXJtd2FyZS9zY3AuaW1nIGluIG10ODE3My84MTgzIGJ1dCB3ZSB1cGxvYWQgc2Nw
LmluZyBpbgo+ID4gL2xpYi9maXJtd2FyZS9tZWRpYXRlay9tdDgxNzMobXQ4MTgzKS9zY3AuaW1n
IHRvCj4gPiAKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC90cmVlL21lZGlhdGVrCj4gPiAKPiA+IEN1
cnJlbnRseSwgdGhlIHNjcCBkcml2ZXIgd2lsbCBsb2FkIGZpcm13YXJlIGluIC9saWIvZmlybXdh
cmUvc2NwLmltZy4KPiA+IHRoYXQgbWVhbnMgdGhlcmUgaXMgb25seSBvbmUgZmlybXdhcmUgZm9y
IGEgc3BlY2lmaWMgcGxhdGZvcm0uCj4gPiBJIHRoaW5rIHdlIGNhbiBzZW5kIGEgUEFUQ0ggdG8g
bWFrZSBmaXJtd2FyZSBuYW1lIG9mIHNjcCBiZWluZyBtb3JlCj4gPiBmbGV4aWJsZS4KPiA+IAo+
ID4gTWF5YmUgZ2V0IGZpcm13YXJlIG5hbWUgZnJvbSBkdHMuIGUuZy4sCj4gPiAmc2NwIHsKPiA+
IAlzdGF0dXMgPSAib2theSI7Cj4gPiAJZmlybXdhcmUtbmFtZSA9ICJtZWRpYXRlay9tdDgxeHgv
c2NwLmltZyI7Cj4gPiB9Owo+ID4gCj4gPiBEbyB5b3UgdGhpbmsgaXQgZmVhc2libGU/Cj4gPiBJ
ZiB5b3UgaGF2ZSBhbnkgY29uY2VybnMsIHBsZWFzZSBsZXQgdXMga25vdy4KPiA+IAo+ID4gVGhh
bmtzLAo+ID4gQWxsZW4KPiA+IAo+IAo+IEhlbGxvIEFsbGVuLAo+IAo+IHdoYXQgeW91IHByb3Bv
c2VkIGlzIGV4YWN0bHkgd2hhdCBoYXMgYmVlbiBkb25lIGZvciBvdGhlciBwbGF0Zm9ybXMgYmVj
YXVzZSBvZgo+IGJvdGggcGVyLWRldmljZSBmaXJtd2FyZSBkaWZmZXJlbmNlcyAoZGlmZmVyZW50
IHNpZ25hdHVyZXMpIGFuZCBwZXItU29DIChkaWZmZXJlbnQKPiBmaXJtd2FyZSBlbnRpcmVseSks
IGZvdW5kIG9uIFRJIEszLCBpTVggRFNQLCBRdWFsY29tbSBNU1MvRFNQIHJlbW90ZXByb2MgYW5k
Cj4gb3RoZXJzLgo+IAo+IE9mIGNvdXJzZSB0aGlzIGlzIGFuIGFjY2VwdGVkIHdheSB0byByZXNv
bHZlIHRoaXMgc2l0dWF0aW9uOiBwbGVhc2UgZ28gb24hCgpMb29rcyBnb29kIHRvIG1lISAoZG9u
J3QgZm9yZ2V0IHRvIGtlZXAgYSBmYWxsYmFjayB0byAvbGliL2Zpcm13YXJlL3NjcC5pbWcgdG8K
bWFpbnRhaW4gYmFja3dhcmQgY29tcGF0aWJpbGl0eSkuCgo+IAo+IENoZWVycywKPiBBbmdlbG8K
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
