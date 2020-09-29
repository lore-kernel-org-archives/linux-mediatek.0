Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2EDC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 00:46:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E5A2076D
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 00:46:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WYqJ5/ZC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlYdO7jq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0E5A2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Rj+OOuFimpaOQD3LWDfbUMO1KnqyB+KxhLZsS70yVc=; b=WYqJ5/ZCgpKVVVt5Wsp8L1aCS
	C8jYo8c9XZnglcjomZJX0SliYUxFBAwOpnKuh/bAxICjEsFws58KwgQOKKw7c6263GA31FfJy03/P
	42Es/NXC9vvgtjwSVI6v8nB1wHCBCE76FeeNTV23rNikijs+jqKDK2pk/GXatYB8LE6K9MjbQL6zx
	Clbnvlwgw4vM/JTiU+W5X8IGkEKRSkOUw9eVDuoYzlICGtnYAYOqVwztBX7oAblqMjXpa1SKv21II
	RxNdP/g35PNfK03GuWVP9jJLBh5Zz4w0+59j2Y9Ew8RTXB0Q8PK7Tk/kkA61DkJG0shX8GVuaJ8bc
	aebohUUBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN3mf-0004s6-DZ; Tue, 29 Sep 2020 00:46:21 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN3md-0004rF-VO
 for linux-mediatek@lists.infradead.org; Tue, 29 Sep 2020 00:46:20 +0000
Received: by mail-ej1-x62c.google.com with SMTP id z23so12371628ejr.13
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2020 17:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DCSkx39v+5WgV4TIc07LMkL8Pce10dvaG6mrcOnTXJc=;
 b=UlYdO7jqyNuQecHHvclKhQwQ7pTWovhjW8FbPTYFanjn/UPQL69+rGJ0srFByLhbBS
 lVulFazewiKVcJUlB1yN7NvXLPp5UbxfVJux+iAY5xDaD+LskiXf64vo9eNOMelMvjvg
 sYUCbdrYanCy9fTR3E/pxPKA8S6kTK3ZJqmIhGODN58jEFR64fkij37vxse3vQWVIJ6y
 N2MjVO/XpM/CbS0+biabyuMhVG28DRludZddyBAkm8rkAd8ogWhBKMbQu/SXfgJhhAkO
 POPWppPj06UxryWz0Cn4z5cyf1iNPvQLS4fKzJKedTEld7BYuhZeqmDRSc8PHwL4PbjW
 XHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DCSkx39v+5WgV4TIc07LMkL8Pce10dvaG6mrcOnTXJc=;
 b=PNzr/+gLKwOQyToBtVs3QxYt3UJFQHddmHdTYigQObHcLUt7Sxi1/4oxG2ykLHRFA9
 rINY80ShGC+z4qEa/sEJXkrUaplSPUkGS6zQUGy0v3U4IGAym6m94CIANcujP8kBEtBW
 GYwOYQ3XFSbY6kTNWVEjtbpHoc05AtZTDqs52tsKzMVgjVi+qTMMKiL+pz1nXhhz3x7j
 ikDLCnGbGNL5m3eWYO+GV61eKH4jfTNTVWYg6/vcs0YlG9CWxyTE52LEjHZk+1I6D2eM
 2cU+Vk2uxSDbcavTgR9ytVFZ3uL2b/qPonNUD4VtFM0IizueXh0Ng45MVoVkrHGUqgcE
 B/qQ==
X-Gm-Message-State: AOAM532S/Fg75GWgUpGc+/pkDsekfHT593v9WPuK3fS1CQA5xdEakyX2
 l4X407d/90gb0NbEZOYJ4MxmJ/Vs+HCvoEr9I2E=
X-Google-Smtp-Source: ABdhPJwceB1tV3x6CHt5EPfVZrUGQ0m0bruN037I1JPqL+9NqKMA36Ns3+VawWGu+dJvrTdUNmH7FfoRI/7I5JUbjmw=
X-Received: by 2002:a17:906:2b83:: with SMTP id
 m3mr1353576ejg.456.1601340377166; 
 Mon, 28 Sep 2020 17:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200914231227.30500-1-chunkuang.hu@kernel.org>
 <CAAOTY__u7AgKuLc6mVoVZrt1sQnu4vYyn8EwhK7B4dh7FoNAug@mail.gmail.com>
In-Reply-To: <CAAOTY__u7AgKuLc6mVoVZrt1sQnu4vYyn8EwhK7B4dh7FoNAug@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 29 Sep 2020 10:46:05 +1000
Message-ID: <CAPM=9tyuPyrFTgROQE6ig7NOtMxqeMdqnafQy968i-gtOU74Dg@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.10
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_204620_040383_A4C563CB 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 29 Sep 2020 at 01:55, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Dave & Daniel:
>
> I does not see these patches in drm-next branch. Does these patches
> have any problem?
>

Sorry just got caught in the queue, should be all landed now.

Thanks,
Dave.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
