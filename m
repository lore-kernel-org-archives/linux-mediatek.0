Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D43C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 09:48:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B70A61B5F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 09:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B70A61B5F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dy8/Ggj2GNloLWEiU7pQxSEmoXgRwbHrEjr+kngdJLE=; b=AkfZwTVeiU0oSW
	mREP1plNSVc23D6OY4rEY3MqcF7E8yY00/zX2bAK+9YfVgzIvqcSIW65lunem3Q1Q+VJr6KbZliAb
	8F0BKaLeux5iJXC6veERjrqDK21Pg8/pTniofEDYF5da+7rYCtucuf9QSYhc1BM0BUKqEkN9ynNrH
	B0N/SBpa96BsUMwuiBHCZ8VrH5g0zg0qZ7YzaPmtrwCWKaRJnkINjhoCWIm+xWENKWxH6FAqWZAf4
	fvk4JoNkMnhlGpXvrdq8GPkYLQvbCHaIzpHMG1mdpSVO5Y1hSDzYqMcGo3Ud1QXgPR10kTPmvAMiA
	Dlazz6/zhGlb9DM+ObXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mne1r-007N5L-5Q; Thu, 18 Nov 2021 09:48:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mne1p-007N4x-2J
 for linux-mediatek@lists.infradead.org; Thu, 18 Nov 2021 09:48:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id n29so10287341wra.11
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Nov 2021 01:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yZtWnV2AZaTtP7W31ku5iWN+RjlPIjMELYCK0vwIHbQ=;
 b=HZWqpB6kFbD+fz5zJokWz51ktHZPeZ7IeIpoCZ407WXMnXPc7wpkgf+Fbv9QgTn6Ms
 zaUZ2kCSuHX+PXyxJ8dDdCRoimWUriQbmsnvAMe8QZCGwH0c4d278pCrnUZ5f8tsU/5I
 K8EscoS8cxrF+j2+pDpkuJmKFJcltxwSG0FqdaX8UPT8KbzpMVXFP3typfVGtKwE3mNt
 ev3kxzF68C3cu0rrv5PDC4hIv7sAtGyWETSaSp6HytSy4bwOEx1PLDlS37Frz4R/xiAS
 KkPr+jAoGY+32/8M3QqiSnfQZ1tXBBcVCQWy8h1TRgMUJYYgcaygaBu7fzvOEX6yU9l4
 w2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yZtWnV2AZaTtP7W31ku5iWN+RjlPIjMELYCK0vwIHbQ=;
 b=HeFNPAabQKWiviFNIds33798MlazOqhSeAP2ZYWx2Yc+eJtJcMt9SgalqaM9B77lWp
 0jOOkPmUJO30Nf8jXTZfyGJx0U64gJbtjpvFjS3QLso/56dY9xUbUmfK68uhzt3Jjgy9
 bMSqknsiBd+iAkSoupqNHlOZVueHasRAc1jJoXpjwuP72daruJuo3QLD4xk5gjtlWyQR
 w+Jzs92YsOnEs883cbRSvHgIvADFIyTzgKZfjVcH7BjHUMn7HTy2fAGrKzZ7TfEjppGS
 8k5SWHUcynUTZT6YZG1qW0RFFA/5auPCQRQq2g67brd3TzCLWLMF+6NOWK7MEZFCOw2F
 33gA==
X-Gm-Message-State: AOAM533mcZFIGYdnhWv2uV2/vF9JJZl0e3o4E5rqUylfHtj7s3EeVsZQ
 SCqLB+KASigpczk3UoJuZ4ht9SH/nZREERsqNEE=
X-Google-Smtp-Source: ABdhPJxiBmKacSHCnqardmw88c4Q0OW5/V3fLQzY75pI9koggT83OYbb35ZfIORvxITUz582p+Dl+EQo408sLfo+RiY=
X-Received: by 2002:a5d:598c:: with SMTP id n12mr28836702wri.250.1637228903193; 
 Thu, 18 Nov 2021 01:48:23 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-17-daniel.baluta@oss.nxp.com>
 <YZU75B2JHbYHy40l@sirena.org.uk>
 <e918b4c4-dc85-dcf5-2781-5edfcd1bf1a5@nxp.com>
 <CAEnQRZBCc4bhX-sT43KT6Tb-=RK=J9poxRvEM_H=1oXh0_AsPA@mail.gmail.com>
In-Reply-To: <CAEnQRZBCc4bhX-sT43KT6Tb-=RK=J9poxRvEM_H=1oXh0_AsPA@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Nov 2021 11:48:11 +0200
Message-ID: <CAEnQRZAgRW-VRGOsKninEV29NJJH4GjoaOaEAEYbHFqtM3PiHQ@mail.gmail.com>
Subject: Re: [PATCH 16/21] ASoC: SOF: topology: Add support for Mediatek AFE
 DAI
To: Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 AjitKumar.Pandey@amd.com, Balakishore.pati@amd.com, vsreddy@amd.com, 
 Julian.Schroeder@amd.com, vishnuvardhanrao.ravulapati@amd.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?WUMgSHVuZyAo5rSq5aCv5L+KKQ==?= <yc.hung@mediatek.com>, 
 linux-mediatek@lists.infradead.org, 
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_014825_151178_C33EA4B9 
X-CRM114-Status: UNSURE (   9.72  )
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

On Thu, Nov 18, 2021 at 11:34 AM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> Hi Mark,
>
> I noticed that you already applied this. Should I resend the entire
> series or just a fixup?

Later edit: All good. You applied only the AMD patches. Sorry for the noise.

Will fix and resend the MTK patches.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
