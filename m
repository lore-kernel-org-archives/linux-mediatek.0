Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQ66D9Kfs4uHMoEFBgHf4dJkf+VJCbTQ/fqNzhCLHqM=; b=vWRU14lnHkC8JF
	rf2+akE+3eAGpVpA+yr2h8XeHnR5xg9MLFDSarEv8DAR2FRVROhvSB95nFFIuhDs1/eF+8lAoflic
	tm3m1dURU+p43PV8ODTg9IDLCkpzXbRoB0tFXs9mI5t3bRUTBVZhE7BYW9ijY6UT7WXAzDfaglj42
	YJyGCkNVINMBFlFMeQAgac3phA1WdgXeG+tyYFC+bubnS4HUG8fxjtmL2LYG2aGxPAYbFx85jBOo2
	B/hCBhwOrBYaybxFQbQ1tQfRyxxd8PEcfkCbSTlWNTt1Ageeuc42uwexpqeMxW1hkNV8gqftvar5l
	qxWyoE/fksBE3hQNC6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnMU4-007Yqq-Qo; Sat, 07 May 2022 15:36:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnMTt-007Ymj-Gp; Sat, 07 May 2022 15:36:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E507B6129A;
 Sat,  7 May 2022 15:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B00C385A9;
 Sat,  7 May 2022 15:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651937788;
 bh=xszih1+Cq3Xjrwud28Q+7VWp3eMq4XebND2xzmMcLkg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IadLKrnIL0OyA/c6zj13NgHO347dnipgKE07v9OnbixpTw7JdBmYYMG+UTrrDMMge
 m/HM1iqP2tLbIhsqvTP9AKCeJZ+0VA0jrDfYRgWLaGwmZeq31mPK/66y0+hXtePJE0
 zVPbqFpzrO2/DYAvNr6S1zMZwgQ/bhVaG0B32x6F7fiPUSQuJiIbYo6HLAu/faEdlZ
 ycFYQnAOEGJyhC3DvS60t5fc1H8FKo8GChWgC4C1onc8ifkqZfSzmNItJxmmcqhNOD
 /aEYteEjCDnJ8nvSan7scZk/mRbe/gYcRgAGz3wn9ngbA133f5GWsnnqsLFKAe7boj
 oKk+5WsGu6fRg==
Received: by mail-yb1-f170.google.com with SMTP id v59so17657512ybi.12;
 Sat, 07 May 2022 08:36:28 -0700 (PDT)
X-Gm-Message-State: AOAM531CbVsg2oYF7fMY5AhRp7CaVGXZus8wgtG7HSgKOf41WQYAdQXf
 b0q4+sFnp9JxnF+jSg0XlJANxGebfdigoglw9g==
X-Google-Smtp-Source: ABdhPJxXklXAgapKtKHtY50KvylR5sWyT+dCgpaCeOO2FWhn2I/4IxcIBHR2wcvnENeeXMDw2Ndi4ga5jlg4qlEzM4Y=
X-Received: by 2002:a25:c842:0:b0:64a:9122:5ec4 with SMTP id
 y63-20020a25c842000000b0064a91225ec4mr4022064ybf.196.1651937787858; Sat, 07
 May 2022 08:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220504115501.3490-1-rex-bc.chen@mediatek.com>
 <20220504115501.3490-4-rex-bc.chen@mediatek.com>
 <eb3884ac-56b2-4c37-05bc-82e8e44b22d2@collabora.com>
In-Reply-To: <eb3884ac-56b2-4c37-05bc-82e8e44b22d2@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 7 May 2022 23:36:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-z0buFJ4NRSiEZ9mpSzN7dFUoJYaD8r+GRCFs7cF06_w@mail.gmail.com>
Message-ID: <CAAOTY_-z0buFJ4NRSiEZ9mpSzN7dFUoJYaD8r+GRCFs7cF06_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] soc: mediatek: devapc: Add support for MT8186
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 krzysztof.kozlowski+dt@linaro.org,
 Matthias Brugger <matthias.bgg@gmail.com>, runyang.chen@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_083629_641330_492DC101 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4g5pa8CjIwMjLlubQ15pyINuaXpSDpgLHkupQg5LiL5Y2INDoyNuWvq+mBk++8
mgo+Cj4gSWwgMDQvMDUvMjIgMTM6NTUsIFJleC1CQyBDaGVuIGhhIHNjcml0dG86Cj4gPiBBZGQg
ZGV2YXBjIGRhdGEgYW5kIGNvbXBhdGlibGUgdG8gc3VwcG9ydCBNVDgxODYgZGV2YXBjLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFJ1bnlhbmcgQ2hlbiA8cnVueWFuZy5jaGVuQG1lZGlhdGVrLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5j
b20+Cj4KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dp
b2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
