Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF604C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 23:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F+CzXM67pZ6FwLYmRhadn93ZfRJjwdiZT8cLm8mwck=; b=dTbAT0UJlm4joCC0eobFm3+40l
	xBKri+RP2TAS1U0YlNpQwBhP6Vpr4RFAZiMAcL7UpRJ7RMh36HThgabfITF2ItV6lK9GRAEnldSHd
	dDS5QIACqtAu0JV7PiOGO1Y8Ml5N5v3/LLh4lGwNEtdTmjuHCxfQkaQnSierMerfSYOV/y21vqdj6
	2WV41tF8E7ZT5bjbOKWmrC0mKRkJteVZE3OFK/l7xxTa5VkD7YqTbRhvBbLlw+/VywL8INH54Maeo
	0RD3MZ4QoDzqIKcT5DCm30Q4cT0hXmeGmh4+GxetbKYU8knWmb6a1f8pkc68WBHC/Q8RNl8Iwcww7
	LI9GyAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0tIs-00BqwG-Cl; Thu, 01 Dec 2022 23:49:18 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0t3C-00BiMp-Ui
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 23:33:08 +0000
Received: by mail-io1-xd2d.google.com with SMTP id c7so2106033iof.13
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 15:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/F+CzXM67pZ6FwLYmRhadn93ZfRJjwdiZT8cLm8mwck=;
        b=emA2qlXO2an42eHY2SLSOzdZDNxzb7yUPGxmXbfhM/KIKNqnUiXcpVjkUGfRRzMcB5
         yJZwCVvgA9u2WwUuZyzbkr2OMIJReve4sfAGceGwczMXUqk2rr5Rosdt0+EZgfercRyi
         v2phsXe7uf24chU7LeIH6W/ljCoKtgD+B04hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/F+CzXM67pZ6FwLYmRhadn93ZfRJjwdiZT8cLm8mwck=;
        b=44cJmm4BhfDhbTO9HkVKgJUGBIC4+WA48THged3VgLxaMQf8fgxQViUlow40emVx2c
         WnZ4AzNIRgLHaESEcIRvgZsOAT3tiijXohv+Z0s8n2aANV6FmGety8IZdII/WjTQGuwu
         fPMKoHmPhCfVZewPFF1E0NAhTs/1IZvevIjfpcJzXfJlu7b5eMH+JTA01hnjXzCnxby9
         okPbpb3pr7y5pOAmei9W5kNGq/7+w9XuZgZt6FJ3E3ALHGD2+bpb2JhgPPB+aWl7Zp6x
         c1V24a+a+KeRFoPUbP1YnIo4SswSPShR+AVYyGPWUZM+RHTbOOMjpv4HfUB/0w3iOHFF
         IP7g==
X-Gm-Message-State: ANoB5pnzQ33/8kdMFUG2bWB3A0PPmxhd0ydK3S4MrHTUviwptolXS/NW
	MiaNz25RrUB6y/by07+C3CyZj0oua/LjS5QwWp+wKA==
X-Google-Smtp-Source: AA0mqf71yu2oELmppvrcvNk/0n9zFUKtJwMc9lGxI/HXhZleYOTd+laB/qRays/rTen1+zjk5nzHWF407FcnpvMdzYw=
X-Received: by 2002:a05:6638:1a98:b0:375:61b2:825a with SMTP id
 ce24-20020a0566381a9800b0037561b2825amr33367959jab.147.1669937584511; Thu, 01
 Dec 2022 15:33:04 -0800 (PST)
MIME-Version: 1.0
References: <20221101142410.31463-1-peter.wang@mediatek.com>
 <98bfafd3-c7b7-89b5-497a-aa694d0152dd@intel.com> <5e00ce60-3859-4964-11f7-e036f6dda56a@acm.org>
In-Reply-To: <5e00ce60-3859-4964-11f7-e036f6dda56a@acm.org>
From: Daniil Lunev <dlunev@chromium.org>
Date: Fri, 2 Dec 2022 10:32:53 +1100
Message-ID: <CAONX=-e1NA--3taTmfbUV+hR_LOSqvBqz_=1mPmYZWaKGGR=ig@mail.gmail.com>
Subject: Re: [PATCH v1] ufs: core: wlun suspend SSU fail recovery
To: Bart Van Assche <bvanassche@acm.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, peter.wang@mediatek.com, 
	stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, 
	naomi.chu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_153307_074792_3CA7F92E 
X-CRM114-Status: GOOD (  14.59  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 1, 2022 at 4:50 AM Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 11/30/22 02:17, Adrian Hunter wrote:
> > On 1/11/22 16:24, peter.wang@mediatek.com wrote:
> >> From: Peter Wang <peter.wang@mediatek.com>
> >>
> >> When SSU fail in wlun suspend flow, trigger error handlder and
> >
> > handlder -> handler
> >
> > Why / how does SSU fail?
>
> I'm not sure but the issue that Peter is trying to fix with this patch
> may already have been fixed by my patch series "Fix a deadlock in the
> UFS driver".

We observe a similar failure scenario when a device tries to change
power mode (e.g. due to autosuspend) while "purge" is in progress. It
appears that in this case the "pm_only" counter is increased on the
device queue prior to the attempt of entering a runtime suspended
state, but not reduced upon it failing due to the device being busy
with an ongoing purge. That leads to a deadlock of subsequent IO
operations to the device.

--Daniil

