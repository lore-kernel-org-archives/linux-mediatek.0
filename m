Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDB8C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 02:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abv0F38Kb+H1iq841VQW7GAB7tr+6RM1I7/gkXbGhvM=; b=N7IpMBlJjraIF2fbilZUS65Glk
	FLD6Z/UzfFkIz3KV2XicqwflNG2gU3s/ootZIsf8jjCrRgGkM1hEtZPErzfuyy6FCdr43L8sgiysF
	K0+I/xOFpm4nnG0m1dSIR9il77SGTOhCWYszc86zVe7t+Ks9aqm4EC3gyrC8KjHeiYGKABL+Iox4M
	I2C4N8pYfXWxT+fqiv7Uz7rzcFybnLcs4IIWFZXj1AMFugT4DIk/MQ6gCzhirVZpHE2T5O2e8wWPv
	FTj1QSQo8WRj1aJgevhw+z0VrTfU1rE84a/Jqa1U1a+4wT5JdAO4RRG2J20DdfjchPcDCLdOEA6+y
	lUHlsjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pUW-00CFN0-3B;
	Tue, 30 May 2023 02:53:44 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3pUT-00CFJX-1y;
	Tue, 30 May 2023 02:53:42 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af189d323fso57148621fa.1;
        Mon, 29 May 2023 19:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685415216; x=1688007216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abv0F38Kb+H1iq841VQW7GAB7tr+6RM1I7/gkXbGhvM=;
        b=GBZoAIJldvjvXxQlv3aSpuDSzWykHF7NTzRVvsiSnG2TBH6OoMl8xV0belYMoYUd0r
         B4jzbszYhWlMUjx0lyvh4R5Iddor6Okxf8OCze1QtBWbS2vc6UxK+tE1jmEFFgBCNJ5Z
         hRQlPCn6EWLHIncYKZAeAsE3IJ0QEFAFC3BjgkUuB+0RcsLl7ssaIsEA0qdPXFPvVvAx
         1uDlh7jZEDRpraLHxhC81lZsy7+PpX9jdmP+rsqVOLb1N2xguubUDovqeca+aYT0ZkJB
         +x6F5betYYURb4w8IgsIooMvjDgE0JrqnHPmDEOKMsu/nerSZjL+SwVhDfcZu4Hy3Zhb
         HG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685415216; x=1688007216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abv0F38Kb+H1iq841VQW7GAB7tr+6RM1I7/gkXbGhvM=;
        b=JHsobh1gIEK0Qoa1RLjQTUHkjIa2w77r5A+EN8J+EOjTZtfadTHul9Qw3Os0Xq90v+
         DnRxpGMNDYl7mFj76R2dKQTFmROVQydFzsxH40TYXkc0UjcdYWY/LlYi+dzCADv0C8r9
         70moTCCl28rri/i0QTvxmXKrlpFiAPvxbhYir7iAFJDjDPabtnDIiiWGIN3TnVNMO+m6
         5X95nK5s5inT5yyO9+mYFbcp7ME/0AbxL2BDD09trD4B9qwY5xl0xKxWqjhFJNYrRolm
         YJFm4zxu81yex4yDwXMJbdR3pFO5i+V9Nk5R0AiJytH4DpxroljjfFtKpkPG3zNpU/E+
         frjQ==
X-Gm-Message-State: AC+VfDx3eFwKSw8JNPmUlRvWIe09DZkC+TeaPPZ+s4f/C82W4l2vDwoI
	nMVixftjh3lVzCEF+2Nbn7v/7XAwQ99S0QtXdQ==
X-Google-Smtp-Source: ACHHUZ77y0PA2RlEEvFIe5qH2zMe2mxNW2B+qocVvwjH5POSpPgz9W6FNC2AhueN6zpdzHPKkZU4WNJvPyEw4+B4Rd0=
X-Received: by 2002:a2e:b5dc:0:b0:2a9:d4f0:6 with SMTP id g28-20020a2eb5dc000000b002a9d4f00006mr3800615ljn.17.1685415215746;
 Mon, 29 May 2023 19:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230530023227.16653-1-powen.kao@mediatek.com>
In-Reply-To: <20230530023227.16653-1-powen.kao@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Tue, 30 May 2023 10:53:24 +0800
Message-ID: <CAGaU9a9q2j8jSPjufa__vTCoW_beQFL9VjSzm5uQqqAsVLr+Hw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add MCQ support for MTK platform
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wsd_upstream@mediatek.com, 
	peter.wang@mediatek.com, stanley.chu@mediatek.com, alice.chao@mediatek.com, 
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com, 
	eddie.huang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_195341_654477_D018B499 
X-CRM114-Status: GOOD (  15.54  )
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

Hi Po-Wen,

On Tue, May 30, 2023 at 10:44=E2=80=AFAM Po-Wen Kao <powen.kao@mediatek.com=
> wrote:
>
> v1 -> v2
> - Introduce MCQ SQ to CQ mapping vops and provide MTK implementation.
> - Update export symbol patch
>
> v1
> - Separated from topic "[PATCH v4 0/5] Several UFS MCQ Code Changes".
>   Here are some changes since last upload
>   - Store irq in per host array
>   - Symbol rename
>   - Use ufshcd_mcq_poll_cqe_lock() instead of ufshcd_mcq_poll_cqe_nolock(=
)
>   - Handle invalid irq dts property
>   - Remove ufshcd_disable_intr(hba, MCQ_CQ_EVENT_STATUS) in MCQ mode.
>     This will become host quirk later.
>
> Peter Wang (1):
>   scsi: ufs: core: Introduce mcq ops to config cqid
>
> Po-Wen Kao (2):
>   scsi: ufs: core: Export symbols for MTK driver module
>   scsi: ufs: ufs-mediatek: Add MCQ support for MTK platform
>
>  drivers/ufs/core/ufs-mcq.c      |   6 +-
>  drivers/ufs/core/ufshcd-priv.h  |  10 +-
>  drivers/ufs/core/ufshcd.c       |  11 ++
>  drivers/ufs/host/ufs-mediatek.c | 188 +++++++++++++++++++++++++++++++-
>  drivers/ufs/host/ufs-mediatek.h |  33 ++++++
>  include/ufs/ufshcd.h            |   8 ++
>  6 files changed, 251 insertions(+), 5 deletions(-)
>
> --
> 2.18.0
>

For this series, feel free to add

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

