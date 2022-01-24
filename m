Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56302C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 17:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asu00mXsB5M7TJYghlFOQzYfhiLGwj/h6AayMKfvifg=; b=o7CNVPettQYhey
	mQBPTFz2ye5Mu2ZOGUDmMgK5lRH5ocyhDq+c2jepnPUk6RbkjE9sEnYATO8OCrKhdv1lC5Gp9ry+z
	cWvfoMol845qeGpYwyhwFvFsl70mUF48TAUYq2b0gFSvkslc97WJNgryjlNWbAGITx/ENQUT+K300
	0s8j9ilk8qPGzmLbHeJArnPvRBLOPtUcwRR0UxQbO3sjRbgcuMTEHla4Bf4XKhYqlattATjdP+Xz6
	itUh9Yjj+SR2olp6H31tC9+U6I/wVLpUip2xqdKdutHouv0PmhXVbHX5jOUKM9mKeJdiQuvjTk6/j
	nfxIYjbvgzWsOby/8g7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC2ua-0049kw-3L; Mon, 24 Jan 2022 17:13:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC2uX-0049iB-Im
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 17:13:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id o64so17093037pjo.2
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 09:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yz3Kx4MHq06ExPu9kTL/jl3NneB6Xj2/dNX33XiW2j0=;
 b=gDMwYCxEfk6Fg2wCwnriYNJAh7na79iw0SgOg2pyoNDgmJ0+JZcb8+1nY4Do7tGpe9
 iD7guUzqpQjCPvIwokQ6TOrFznPIeMz5bgsobMpnXcvImycwdHYe/A4AP+Xt2bCGA+Rg
 7e66N7FbFHFicGbWd+/0CRz1wMM6KFbrRUOErGujgym4uTa/x52vDuwHXouuhZt89W/W
 hpQ/PsX3BtXWPEs1MKy6ooB92YI8IWnnyjhSHVRMzwnlWNPr1evKukjfiOEi4IJiidyG
 6XL0OJ8EDODesRjw6utIaE00T5KJcxSY/hSh/DPZHN5gtcXmeLTvCmnRc3GsMaKkaiwq
 I1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yz3Kx4MHq06ExPu9kTL/jl3NneB6Xj2/dNX33XiW2j0=;
 b=l4cU9wA2U9mOUwuGGgnYOXznYnwxzfecwybWjOO4od7IVGlXEFlZXiQtgvITyVT29a
 Pxrw0qhW+0ebC6fssDr8uLm9L0To9Ol18Iy1jIA/D1SOZRftlGqziTcGiJqP3M3gqD1M
 c87Dio9WY4QEkv6EYAQR0bMGyqc11IoskF+lzW5pZovelIWN/m0XgF30fREa47bDOpUH
 Tux0AI3EQQfXfNQem9qSCyoRo2FAwjwKqADziV/X6TJFMfH8PPCZiv7rTQJo8LUSTeej
 K48M2m53h9TEoxkbgLwGK9Z6yWd4g97Y1HmVkMgR9R7hnnFh2neYCw1k/A5XRAC1utQ3
 6HIQ==
X-Gm-Message-State: AOAM530kLocuxMFjcCJnwQx7zkvC1a73YwnWGmAKoAEsKUI0q5CR64OL
 vWhRmPilkxfSKPv9ZR+3EBs=
X-Google-Smtp-Source: ABdhPJyt8Q8UYMb8ZPX5O55xt98T26QcckoaPZ4g6z41q+Z+eKVHji1BFoUdALgiWj9A/kZe4ZZ2og==
X-Received: by 2002:a17:90b:4d11:: with SMTP id
 mw17mr2845071pjb.100.1643044421921; 
 Mon, 24 Jan 2022 09:13:41 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 t3sm17894634pfg.28.2022.01.24.09.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 09:13:41 -0800 (PST)
Message-ID: <acf98ec3-1120-bcc0-2a2f-85d97c48febd@gmail.com>
Date: Mon, 24 Jan 2022 09:13:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: MT7621 SoC Traffic Won't Flow on RGMII2 Bus/2nd GMAC
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>
Cc: DENG Qingfang <dqfext@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, openwrt-devel@lists.openwrt.org,
 erkin.bozoglu@xeront.com
References: <83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com>
 <CALW65jZ4N_YRJd8F-uaETWm1Hs3rNcy95csf++rz7vTk8G8oOg@mail.gmail.com>
 <02ecce91-7aad-4392-c9d7-f45ca1b31e0b@arinc9.com> <Ye1zwIFUa5LPQbQm@lunn.ch>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <Ye1zwIFUa5LPQbQm@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_091345_650389_FB82B277 
X-CRM114-Status: GOOD (  13.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzIzLzIwMjIgNzoyNiBBTSwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gT24gU3VuLCBKYW4g
MjMsIDIwMjIgYXQgMTE6MzM6MDRBTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToKPj4gSGV5
IERlbmcsCj4+Cj4+IE9uIDIzLzAxLzIwMjIgMDk6NTEsIERFTkcgUWluZ2Zhbmcgd3JvdGU6Cj4+
PiBIaSwKPj4+Cj4+PiBEbyB5b3Ugc2V0IHRoZSBldGhlcm5ldCBwaW5tdXggY29ycmVjdGx5Pwo+
Pj4KPj4+ICZldGhlcm5ldCB7Cj4+PiAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+
Pj4gICAgICAgcGluY3RybC0wID0gPCZyZ21paTFfcGlucyAmcmdtaWkyX3BpbnMgJm1kaW9fcGlu
cz47Cj4+PiB9Owo+Pgo+PiBUaGlzIGZpeGVkIGl0ISBXZSBkaWQgaGF2ZSAmcmdtaWkyX3BpbnMg
b24gdGhlIGdtYWMxIG5vZGUgKGl0IHdhcyBvcmlnaW5hbGx5Cj4+IG9uIGV4dGVybmFsX3BoeSkg
c28gd2UgbmV2ZXIgdGhvdWdodCB0byBpbnZlc3RpZ2F0ZSB0aGUgcGluY3RybAo+PiBjb25maWd1
cmF0aW9uIGZ1cnRoZXIhIFR1cm5zIG91dCAmcmdtaWkyX3BpbnMgbmVlZHMgdG8gYmUgZGVmaW5l
ZCBvbiB0aGUKPj4gZXRoZXJuZXQgbm9kZSBpbnN0ZWFkLgo+IAo+IFBIWXMgYXJlIGdlbmVyYWxs
eSBleHRlcm5hbCwgc28gcGlubXV4IG9uIHRoZW0gbWFrZXMgbm8gc2Vuc2UuIFBIWXMgaW4KPiBE
VCBhcmUgbm90IGRldmljZXMgaW4gdGhlIHVzdWFsIHNlbnNlLCBzbyBpIGRvbid0IHRoaW5rIHRo
ZSBkcml2ZXIKPiBjb3JlIHdpbGwgaGFuZGxlIHBpbm11eCBmb3IgdGhlbSwgZXZlbiBpZiB5b3Ug
ZGlkIGxpc3QgdGhlbS4KCk5vdCBzdXJlIEkgdW5kZXJzdGFuZCB5b3VyIGNvbW1lbnQgaGVyZSwg
dGhpcyBpcyBjb25maWd1cmluZyB0aGUgcGlubXV4IApvbiB0aGUgU29DIHNpZGUgaW4gb3JkZXIg
Zm9yIHRoZSBzZWNvbmQgUkdNSUkgaW50ZXJmYWNlJ3MgZGF0YSBwYXRoIHRvIHdvcmsuCgpJdCBp
cyBub3QgdW5jb21tb24gZm9yIHRoZSBzYW1lIHNldCBvZiBJL08gcGFkcyB0byBiZSB1c2VkIGJ5
IGRpZmZlcmVudCAKZnVuY3Rpb25zIHdpdGhpbiB0aGUgY2hpcC4gRm9yIGluc3RhbmNlIHRoZSBj
aGlwcyBJIHdvcmsgd2l0aCBoYXBwaWx5IApvZmZlciBSR01JSSwgTVRTSUYsIFBETSAoSTJTKSwg
VFNJTyBvbiB0aGUgc2FtZSBwYWRzIHZpYSBkaWZmZXJlbnQgCnBpbm11eGluZyBvcHRpb25zLgoK
QWxzbywgdGhpcyBpcyBkZWNsYXJpbmcgYSBwaW5tdXhpbmcgZnVuY3Rpb24gZm9yIHRoZSBFdGhl
cm5ldCBNQUMsIHdoaWNoIAppcyBhIHBlcmZlY3RseSB2YWxpZCB1c2UgY2FzZSBhbmQgdHlwaWNh
bGx5IGhvdyBwaW5tdXhpbmcgaXMgZGVjbGFyZWQgCmZvciBhIGdpdmVuIFNvQy4KLS0gCkZsb3Jp
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
