Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D5C4332D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 11:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6FE20722
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 11:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bv8EhU0i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ypLJA4Km"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF6FE20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hucejPk8eyRtRG0336v6/Bf05ZxazwfqEag0BdxE4ow=; b=bv8EhU0iRSrMQv
	d9nDAS1RydEAfV8rHPCmjGNfttOJ3Pk/5yvMzKIqPDXLSDHFeLft9drJNzxkOOgQle+kWHAug7vSp
	Gv0uviXjOgu8yuYxhl0dhDjCGwaUjxxuPW0WvEbNou1UhwoVMprev4OZsfvsBvERLVHCKZZ+bUnn4
	OURpAcB5MhcO18qIX9pDtBkBmVsi7W0orU4LaiuduTpNZIWSMowGRCH10XL6lAi/C4QajUWqLNMEy
	aBNRJ446mplYv1s9P0uCmehr+5Mv0PRWgRcHkVYhBRKKIpwQLVQN08Doom5tGHsGO+xjEC6YPwsdX
	EBFHZ8ZzDG9FMMjFrQew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFG0f-0005af-UI; Fri, 20 Mar 2020 11:40:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFG0U-0004sZ-D3; Fri, 20 Mar 2020 11:40:07 +0000
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D4162076E;
 Fri, 20 Mar 2020 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584704405;
 bh=iy0DPkUN8K/G9bJpje5gyRzlt0Krjnhy7Jq9VXkD4Zg=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=ypLJA4KmidGx0Lf3/OGyq8WwqXPUqQp02gA6ofsognYX/c3pZCkXozDQg9kSEyy4m
 FTHhPfGrroszbknTTIk/a/3GG67Tpfh78D5axGbPHvFom+NjNGz7sSvNbxIWhWNDNR
 jrNTNt87SUb1Df+wR/UwtslkR7Tiolj4oXkXOp18=
Received: by mail-il1-f182.google.com with SMTP id m7so1138641ilg.5;
 Fri, 20 Mar 2020 04:40:05 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0IfgYaBWPfKbHSdhz+rS5C0hK2QKexw25kwt0gaLhn74/sE9We
 nPLalwHQCuuAu2IXLkISwVi2HUio0xpMtE1uUKk=
X-Google-Smtp-Source: ADFU+vuX46aMx1NbY1leqNBC7N7arF+J98DWHRgaTnF95AlB1R3flMuvkmnEcc2Li7GUFMMjhUk/R1ctAydOwUTuUh8=
X-Received: by 2002:a92:1a53:: with SMTP id z19mr7767334ill.85.1584704405029; 
 Fri, 20 Mar 2020 04:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200320071143.4225-1-erin.lo@mediatek.com>
In-Reply-To: <20200320071143.4225-1-erin.lo@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Mar 2020 07:39:54 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5pjvbJvMeKEARCAyztNAspqksfmCnV+ubO4OJnaQo5EA@mail.gmail.com>
Message-ID: <CA+5PVA5pjvbJvMeKEARCAyztNAspqksfmCnV+ubO4OJnaQo5EA@mail.gmail.com>
Subject: Re: pull request v2: linux-firmware: Create Mediatek MT8183 SCP
 firmware
To: Erin Lo <erin.lo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_044006_475619_0986FB59 
X-CRM114-Status: GOOD (  14.23  )
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: menghui.lin@mediatek.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 srv_heupstream@mediatek.com, Nicolas Boichat <drinkcat@google.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-remoteproc@vger.kernel.org,
 Linux Firmware <linux-firmware@kernel.org>, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Shawn Ku <shawnku@google.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2020 at 3:13 AM Erin Lo <erin.lo@mediatek.com> wrote:
>
> Hi, maintainers,
> Changes since v1:
>  - Add information to WHENCE
>
> The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:
>
>   Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/erinlo/linux_fw_scp v12573.77
>
> for you to fetch changes up to 3c213aa59661c4641f0c2166a315140ac0445230:
>
>   mediatek: Add mt8183 SCP firmware (2020-03-20 14:37:49 +0800)
>
> ----------------------------------------------------------------
> Erin Lo (1):
>       mediatek: Add mt8183 SCP firmware
>
>  WHENCE                  |  18 ++++++++++++++++++
>  mediatek/mt8183/scp.img | Bin 0 -> 1027104 bytes
>  2 files changed, 18 insertions(+)
>  create mode 100644 mediatek/mt8183/scp.img

Pulled and pushed out.

josh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
