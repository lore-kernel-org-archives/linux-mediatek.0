Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31665C74A44
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w5BS2JYz2kZQkEeuywTfHp8NdeDU1CPaV3Ohjlv1m8=; b=ET47RUBkaMMJdxg/ex27NV+Fq3
	/vnEc5FYtXLzZK1LbYb/vHNtCIUahm9Q6nx+gwzjNCzDJvutu0Q90QLcT+XJjath4CMVmQ7jWSZJO
	r8SCP1PuWkjT1sJ/6vuy0/YuiW7fEkG8ugqg5e+ZFSG7a1dO88V72YgUG7ftfrw0rDpG+O63FP0QY
	3/xGTy0/nwD8k4EX0FAAC31Zsh/gLDPk7R8cVhwPaId19z/yYGP72RGgTINsHFQ6MliMs+SIfmW1g
	1gU9C07TI5fUFyXtSVTxw414Lazsr+k2JlDOEczEO0ZofLF1FiFwadqVysNBgeBZK+52yaRP6U3lk
	z6X44uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDH2-00Dk7g-BG; Mon, 06 Mar 2023 16:01:16 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDGf-00DjvS-R1
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 16:00:55 +0000
Received: by mail-oi1-x230.google.com with SMTP id y184so7395019oiy.8
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 08:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678118451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6w5BS2JYz2kZQkEeuywTfHp8NdeDU1CPaV3Ohjlv1m8=;
        b=jO/l6gl5WIN4qll5tf9EjB45mGMXbF463tOH89tGjxuVT8rN5LVChRIjnmUBkSumvb
         RrtRzOV6kjh0MXFsdfmH50kurJ2Kcfvf1d3cks8Za+NkHteZ12/b2yR3MKI7CfcrUCl9
         bnwq92HMES5s2kKG8McF6/oLzlevGX92itc6m/D8Xvra2G+xropwYFBKv8mCN1sOb4Sf
         pG/q58DLxiSS2Sa+srZHTss/oXTz/lTXOOk3ND8by2e6or+fU5VysnvlAJNhem4h9VyM
         G0FWxbT6tbW78cV7yRfcn6dpxqNtlqPzzw0Nmh7dIx83u2oB3gbgunF3xtEjMhgZm+cZ
         gCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678118451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w5BS2JYz2kZQkEeuywTfHp8NdeDU1CPaV3Ohjlv1m8=;
        b=Xj31lC06NycZ/ZJi7Xdv2Q/Oc1o/jCP57+7myAUrM5j9bMJDFT1nGQbkbgnjFrz+QO
         AuenEGGqIBhkp2Q0MRfa+CZKf3nmXK6Cnv/u7dka5YHRTFVbKkpClxybjkaKgOPqqMbP
         IQweYX8T5bgv5Km9z0MG7zPwBcO63N/JZNYNUgoDpZHL4UXP0LEXIcFxCmNJ0NEGtRND
         /LnXMvWh0B2TLCTJOVFeY0HClFT/VBmhkfLy9t6EjYnmwO/5JpcZq42XpNnuqJoWi7aG
         s0hrf0lHivBCh8siwqbUPnXEynYm4N8hO97fJr7SSuBhD4C4D1a/PnQB8civIbtKu6cl
         X/NA==
X-Gm-Message-State: AO0yUKWDFytMd7ZFFPI+uxoznBy4Z2jhuRBrqUwOujbJ+k4548zKCKxe
	97g1nGmJymBX1Hlg2VK4oHteHnwzTywLYPLSOFhYEQ==
X-Google-Smtp-Source: AK7set/8Jpy/ZNN0pALMDvlhUPzgIohhx0Xl1N5UUOt7NLlnLvVlmpPrWQ1oiOW7cEbO8NieW/hXh1TkDnHVteaOCRs=
X-Received: by 2002:a54:4612:0:b0:383:fad3:d19 with SMTP id
 p18-20020a544612000000b00383fad30d19mr3566227oip.9.1678118450998; Mon, 06 Mar
 2023 08:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20221124074725.74325-1-haozhe.chang@mediatek.com>
 <CAMZdPi9JOQpmhQepBMeG5jzncP8t5mp68O2nfSOFUUZ9e_fDsQ@mail.gmail.com>
 <54c37c8f8eb7f35e4bb983b9104bd232758bae7b.camel@mediatek.com>
 <CAMZdPi8NOfMn99yy043oYGrO1=UrnhhRvpZq-zWe4BfiU_08NA@mail.gmail.com> <PSAPR03MB5653D7BAA0E5DDB2D03B341BF7B39@PSAPR03MB5653.apcprd03.prod.outlook.com>
In-Reply-To: <PSAPR03MB5653D7BAA0E5DDB2D03B341BF7B39@PSAPR03MB5653.apcprd03.prod.outlook.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Mon, 6 Mar 2023 17:00:14 +0100
Message-ID: <CAMZdPi96HtaiPhaCJOpxbMohyGEz4LGPTzv5bvG2iA6QHAFG3Q@mail.gmail.com>
Subject: Re: [PATCH v5] wwan: core: Support slicing in port TX flow of WWAN subsystem
To: =?UTF-8?B?SGFvemhlIENoYW5nICjluLjmtanlk7Ip?= <Haozhe.Chang@mediatek.com>
Cc: "stephan@gerhold.net" <stephan@gerhold.net>, "oneukum@suse.com" <oneukum@suse.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"linuxwwan@intel.com" <linuxwwan@intel.com>, "m.chetan.kumar@intel.com" <m.chetan.kumar@intel.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?SHVhIFlhbmcgKOadqOWNjik=?= <Hua.Yang@mediatek.com>, 
	"chiranjeevi.rapolu@linux.intel.com" <chiranjeevi.rapolu@linux.intel.com>, 
	=?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	=?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>, 
	"chandrashekar.devegowda@intel.com" <chandrashekar.devegowda@intel.com>, 
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"shangxiaojing@huawei.com" <shangxiaojing@huawei.com>, 
	=?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"ricardo.martinez@linux.intel.com" <ricardo.martinez@linux.intel.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_080053_888919_8E1477B9 
X-CRM114-Status: UNSURE (   8.72  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Haozhe,

On Fri, 3 Mar 2023 at 09:59, Haozhe Chang (=E5=B8=B8=E6=B5=A9=E5=93=B2)
<Haozhe.Chang@mediatek.com> wrote:
> I'm sorry to bother you, but I want to know whether my patch is accepted =
by the community.
> Because it seems to be a merge window, but the patch state still is "Not =
Applicable". Could you
> give me some suggestions about this patch state?

Please rebase your change and resubmit the latest version (can add
RESEND tag to subject). Please, also read my previous reply, I
mentioned your change should target net-next... you should add it in
the subject (look at the documentation or other mailing-list patches).

Regards,
Loic

