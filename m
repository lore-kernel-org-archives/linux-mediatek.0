Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC75C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 09:48:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F9B66112D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 09:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F9B66112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEkDTDX+VHksUwWby2htcaidKcsa35SCEs+SxnU0/Yo=; b=G9a2uLYQ22CFGu
	qDpKE/R793Mv9KPuv/ws31qB4MIeR+w/mgr3uO+WaaJ5o4RdDyNZJz1qY+TfSoZxOsIfTTwJGoPDp
	jR6KXpltRpkDUghILI3h7gW4f/+TN7RNI6jiB06qgPgvleeQgziYqRhNH6B8kuQHcqXnMr647muOi
	g1crXtq4eBnX76EApd/a+AeeqjKHwCAkw9Y4u7r+iltmSQOSK84QAUq5eWD2jaD1q33iJewG267Eh
	ZdT62ECpGYUVCcPfia1RymELFpOTI9GQ+757MdVG6oOM5DZerFR7+m6no/VDvaEQ+bb+357YbkfRe
	hOYI0MR/tJCIbYF94MNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvzUx-00ACW1-7K; Wed, 23 Jun 2021 09:48:43 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvzUg-00ACST-8A
 for linux-mediatek@lists.infradead.org; Wed, 23 Jun 2021 09:48:32 +0000
Received: by mail-lf1-x12b.google.com with SMTP id d16so3082025lfn.3
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Jun 2021 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fKjqUJhszdXpyl10YQ4tIa0Xd7F4iUZDn2xLPlegnEI=;
 b=FE9pvkD16UFCog6pYfw+v3pkk22K4ZVJ0zpA40ZmsTACa8+HUEKertA/5DIJQRH7oZ
 s/mXcY3jEIW+TEtrd4Q/ywwl3JyabAooIGA70VZESqb8GpqY1Dl0WzM2rpBR+iONY1af
 xlfT5kjs6Rz5lX4/gGFffB/Kj9SU8ZuHIo/YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fKjqUJhszdXpyl10YQ4tIa0Xd7F4iUZDn2xLPlegnEI=;
 b=r3/fDmHu3NKL8EpkJrZoORinbe6PCQ6L0+7GkbCUw7Qsio6Gu7nsVde3rhqSnhV2Jm
 nd88ymrvXw5JeJ8gvB8WavEsd7OWBbbAYOsBDVw3b9nJcFwSUvegWNqNY+M7d4cMb+DQ
 H88zuX5wP9AmU1xTGRBsr3IkPVRIh6rdjm35X44yeVosppP2/ya26O1PuJnik2r9TFy/
 KMsutYuW5GunDi2bwGZpNc6F44JSUa/HnMhjnpYv7pAjY28dGvZbO++MghW7uC7sROf+
 zf4HrWQ+U1TwblqaAjOZc4YE14pGubsV/+/4Da+Z2YuJf6c/4lBbA9bA4VbH0rAbLw8N
 8pSQ==
X-Gm-Message-State: AOAM532irhcPtglIU70pA+hiwHAbK1Ka6u2FsDGevKrB/R4RiTjVBQ6e
 48UI4g2DhFJZC2ENWOaPhF/yZLAkZia16G9w1nfBaw==
X-Google-Smtp-Source: ABdhPJwFufLUGkeN2pDvzmj2Ujaq8TRsFGO5abB0KNvd6vttc1EzSYrcmK6EwOHYKsjU7Jyh6LNg/R9FGuatMvavY5U=
X-Received: by 2002:a05:6512:3f13:: with SMTP id
 y19mr6314168lfa.444.1624441703656; 
 Wed, 23 Jun 2021 02:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210623092917.4447-1-Christine.Zhu@mediatek.com>
 <20210623092917.4447-2-Christine.Zhu@mediatek.com>
In-Reply-To: <20210623092917.4447-2-Christine.Zhu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 23 Jun 2021 17:48:12 +0800
Message-ID: <CAGXv+5GXfabPk4NV=d8YxQD1UHeqE9M7bgCeG-FT0Ef1n5ECgw@mail.gmail.com>
Subject: Re: [v3,1/3] dt-bindings: mediatek: mt8195: update mtk-wdt document
To: Christine Zhu <Christine.Zhu@mediatek.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, seiya.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_024826_331017_C3B58A9D 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Jun 23, 2021 at 5:30 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
>
> From: "christine.zhu" <Christine.Zhu@mediatek.com>
>
> Update mtk-wdt document for MT8195 platform.
>
> Signed-off-by: christine.zhu <Christine.Zhu@mediatek.com>

Please fix your name formatting in your Signed-off-bys and author
for all the patches, and in your overall git setup.

It should read "Christine Zhu", like your sender info on this
email, not "christine.zhu" like an account name.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
