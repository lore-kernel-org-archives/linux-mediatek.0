Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0938C27C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 00:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/Lm5xLMwGGeLnlSnqBVwnceEP3UbmvEzBcXJuPoZCk=; b=yIYT2t8xpYE+wUmJ/17m27yM9o
	RUmpRVhRWC/YyGr2upLYT9xdgKNay0Gz0BbK4r8A9WTNKdUAAANkGa1eXw+Odm0pHS+TCiaVEuWPC
	NJgEnO4rypBu6mOcG8X06aRUP7ANSjTPh0A3lVOfY6NubWNj3b9uMhGrPxsNQKazbiyz9ANEi7OK1
	MSKd5+ZyCOe4vqcprxQHqPOb5O7rEAFUkP7OS+zkYP7tRPHtss1bCzaCI5THQakZgA6Dvnm8lFKDe
	BO8MRSWG67ATI6PePdzGO47eKg6H1bdhlH8Z5C+J25Pw5gBnx/clE98qEbcBT0FrGfaQRQHUWg5uP
	KPbBjcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xDh-003NVJ-1o;
	Thu, 23 Nov 2023 00:05:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5xDe-003NUe-34
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 00:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6AA34B82A03
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 00:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21EEC433C9
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 00:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700697920;
	bh=L1OswcVO61MjalP/YFjT4Z7TxVkgrbjWTBYba3T59WA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ID4CWe6BnTo+UmXx3eIz8eIcmX2c5RyCMeYrwMzknBFqYfLYQWIlKfaRR0hF4LPt4
	 1HMDoRVZDwBhbM9SrOl2WgY/jGSryO9ZYq3A1olkg7LuG64UTbymh4gSKvzrvdGj4e
	 uqD4s4/XnFq69VZusm2YLggq61gCptJ3N/mSR4NhGp4o8QxyBkqXryV001CIeKkIdN
	 KwzSpPkcsOk9h+l4OvwmTr+S3e4KYc40oddRIDd+d3ioWqFWLnzmiFuG+gduf3eyPs
	 AffFyM5xWzQi0FmqCdRWTPlMsSNTUOLHgGx0ZK2YNvgqvg752x88L3RW2BTybPAl0q
	 bPIWe7UdKQ1mg==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5cca712b715so3058447b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Nov 2023 16:05:20 -0800 (PST)
X-Gm-Message-State: AOJu0YwAOFmvCYUFiQmDiOvcTGHRmZv2NSm2M0BhcmPPscAhVsw9I0p7
	ix31oyw+C9eUAGGmHLhbj7ROXhfFfSeO/ihCZoM=
X-Google-Smtp-Source: AGHT+IEZJaaXAVUDl8vtj2YFKAhdUbCYlrHXCWIbVx3fqTcvmXyxAHnY4DYXzN1yTNAjbPWSr3nS11AiwqzKeiq9jUs=
X-Received: by 2002:a0d:ef45:0:b0:5c9:12ec:5203 with SMTP id
 y66-20020a0def45000000b005c912ec5203mr3970793ywe.32.1700697919955; Wed, 22
 Nov 2023 16:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20231121081735.21837-1-jason-ch.chen@mediatek.com>
In-Reply-To: <20231121081735.21837-1-jason-ch.chen@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 22 Nov 2023 19:05:09 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6AdWpwKD1+e4y01fVQG9hq7XFo8bYvpz4BJ9DtvLh1ng@mail.gmail.com>
Message-ID: <CA+5PVA6AdWpwKD1+e4y01fVQG9hq7XFo8bYvpz4BJ9DtvLh1ng@mail.gmail.com>
Subject: Re: pull-request: linux-firmware: Update MT8195 SCP to remove an
 unused packed library
To: Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	yunfei.dong@mediatek.com, menghui.lin@mediatek.com, shawnku@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_160523_152549_FE388AB2 
X-CRM114-Status: GOOD (  13.37  )
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

On Tue, Nov 21, 2023 at 3:17=E2=80=AFAM Jason-ch Chen
<jason-ch.chen@mediatek.com> wrote:
>
> The following changes since commit 9552083a783e5e48b90de674d4e3bf23bb855a=
b0:
>
>   Merge branch 'robot/pr-0-1700470117' into 'main' (2023-11-20 13:09:23 +=
0000)
>
> are available in the Git repository at:
>
>   https://github.com/jason-ch-chen/linux_fw_scp 8195-v2.0.23042
>
> for you to fetch changes up to ebebd79cb34038b0dcc964fbb4a07525b2b790aa:
>
>   mediatek: Remove an unused packed library (2023-11-21 16:14:00 +0800)
>
> ----------------------------------------------------------------
> Jason Chen (1):
>       mediatek: Remove an unused packed library

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/73

josh

>
>  mediatek/mt8195/scp.img | Bin 635448 -> 635532 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
>

