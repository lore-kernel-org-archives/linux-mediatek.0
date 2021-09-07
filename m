Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 16:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADC4D610F8
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 16:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADC4D610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kII/UW720RDx3dh+qCa1/AS/FtczIOiKiYR7Kj+dVC8=; b=LF2TH70L4uU4/T
	0p6STfo+9HEtEpAX9W5m0UGYlt7JzMHU3MhGEDxSsIr+GO9Q5TgZnkHj2hFJHfBLHXKb8frmp/z4X
	jjl6H5LVbSGGIgUw+wj1iTM7ICKIYIZ8mifycQUNYn0sLvulbAMdJmA1EBCX1OW5myHakR30dG+XI
	Vq4WszH7Qm+uybpfOO1O7cmsS77OLH6S1WorXz0uZdyN4TEirRxynoEDte4pHaJVthO4SuC05cqmp
	7LxV27WFEgyvLeExeN6AK9EmGcAgA8odmHXUgtXg+GZ6sYN/Z0D9s6hm6+dJPhQ7aswF0RlROCveY
	Pp+sPKwz9kRJ6iOD336A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNdd7-0049p7-JT; Tue, 07 Sep 2021 16:07:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNdct-0049k5-2Y; Tue, 07 Sep 2021 16:07:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B385861132;
 Tue,  7 Sep 2021 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631030830;
 bh=+lJkGZeGmmojxoICOoYZ2t3AkosVDnXKocMMyh1szbs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QNp9p1TUa3ei4z9ns0GgLtkR1OizOQ1pIKoqKY9MUoxNy8GDuZPe4KneNrFTgnfgT
 E5kOgdQcr4hRziJAzNysLzkRrlDhNh15STVAo5CHzaCvancScfsROamjR1oK+tA2Bc
 VttM+LqvNou2xrah3U5hbymBHgQCcn7wSOV1TrHBYiYB93nN0ihhLs0bzLBRyq7HkS
 wQbGox70OLqF1/49ssoeu1lXRI9v6lv58EBotXOr3odPC4xUwuM9eCPaWPxZJEGSJw
 PF2ikN6g2TRR30hkCYKlox6Qhfh1OGRVI/AyA47mAOeTg1hZgJNoiphaF5Cm41JVmh
 XYLmMUswh8UOg==
Received: by mail-ej1-f44.google.com with SMTP id a25so20716921ejv.6;
 Tue, 07 Sep 2021 09:07:10 -0700 (PDT)
X-Gm-Message-State: AOAM533p0Mw/8+RiJUkgFCSFQ46UxernvWu2NcxMvNGPgWEYSUjLqH3s
 bssbB8ABuLuDLE1lTPRFTi1EGwdDQZKv1ariVw==
X-Google-Smtp-Source: ABdhPJyY5G5Fp3aIZKKQwfIH3FO1wAURJJPIvo91MbXQo53v/T6+cQCTl2RcTXSYs4lmdwE+fxWw+K47Vu/yjAvvJpc=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr18904991ejc.511.1631030829293; 
 Tue, 07 Sep 2021 09:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-5-nancy.lin@mediatek.com>
In-Reply-To: <20210906071539.12953-5-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 8 Sep 2021 00:06:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9pvtP-Ri4UHjRGDvA3j0F7J+HsRqOiNzPbEeE=NmAsqA@mail.gmail.com>
Message-ID: <CAAOTY_9pvtP-Ri4UHjRGDvA3j0F7J+HsRqOiNzPbEeE=NmAsqA@mail.gmail.com>
Subject: Re: [PATCH v5 04/16] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_090711_173633_40031B97 
X-CRM114-Status: GOOD (  12.99  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDnmnIg25pelIOmAseS4gCDkuIvljYgzOjE15a+r6YGT77yaCj4KPiBBZGQgdmRvc3lzMSByZXNl
dCBjb250cm9sIGJpdCBmb3IgTVQ4MTk1IHBsYXRmb3JtLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmFu
Y3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2R0LWJpbmRp
bmdzL3Jlc2V0L210ODE5NS1yZXNldHMuaCB8IDEyICsrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgx
OTUtcmVzZXRzLmgKPiBpbmRleCBhMjZiY2NjOGI5NTcuLmVhYWE4ODJjMDliZCAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5NS1yZXNldHMuaAo+ICsrKyBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oCj4gQEAgLTI2LDQgKzI2LDE2
IEBACj4KPiAgI2RlZmluZSBNVDgxOTVfVE9QUkdVX1NXX1JTVF9OVU0gICAgICAgICAgICAgICAx
Ngo+Cj4gKy8qIFZET1NZUzEgKi8KPiArI2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzBfUlNUX0Jf
TUVSR0UwX0RMX0FTWU5DIDI1Cj4gKyNkZWZpbmUgTVQ4MTk1X1ZET1NZUzFfU1cwX1JTVF9CX01F
UkdFMV9ETF9BU1lOQyAyNgo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMF9SU1RfQl9NRVJH
RTJfRExfQVNZTkMgMjcKPiArI2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzBfUlNUX0JfTUVSR0Uz
X0RMX0FTWU5DIDI4Cj4gKyNkZWZpbmUgTVQ4MTk1X1ZET1NZUzFfU1cwX1JTVF9CX01FUkdFNF9E
TF9BU1lOQyAyOQo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9SU1RfQl9IRFJfVkRPX0ZF
MF9ETF9BU1lOQyA1MQo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9SU1RfQl9IRFJfVkRP
X0ZFMV9ETF9BU1lOQyA1Mgo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9SU1RfQl9IRFJf
R0ZYX0ZFMF9ETF9BU1lOQyA1Mwo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9SU1RfQl9I
RFJfR0ZYX0ZFMV9ETF9BU1lOQyA1NAo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9SU1Rf
Ql9IRFJfVkRPX0JFX0RMX0FTWU5DIDU1CgpNYXliZSB5b3Ugc2hvdWxkIGFsaWduIHRoZSBpbmRl
bnQgc3R5bGUgd2l0aCBUT1BSR1UuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArCj4gICNlbmRp
ZiAgLyogX0RUX0JJTkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQ4MTk1ICovCj4gLS0KPiAyLjE4
LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
