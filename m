Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D32C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64295610CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64295610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtL8yd3fOtcZwI9T1hBhuMugLxP2KuqIXt9iFx8lRA0=; b=po8JglHYrmWDQLkd1HI0/oiNlw
	eC1hRBbKVfGdLj8xNC+Qz/FZz/fFxRPgAWdMG94Vl81lDpjYX26ZAAZBvXFBBGGxC5vM2TRV9kWJw
	yDzRtqxb0rbdfBUcFBu+cJ4YlfAlC8y186eO2vCYZLTNAAXBdH6p+0YzJqaAk0LM+wZjMxBZ5k+7i
	jXCeVzz9gc69nkKmLQxxxWqpoGTWyOrvdOO5iBPLJo5E7zNtw2w8kE27jlmYSrZocUl1/y0MKNwAh
	zR1gyMVhi0P2r+/plItEK05s88YBO1EB0BuGT4+bJRl2rJ4UNDWJArxaqnHh/mw7m1CcyZqqVJ7xd
	EFyO+8zg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5LC-005YXY-07; Fri, 21 May 2021 13:37:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5L9-005YWV-Js
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=; b=zmAhawM5gTnRCvTjqaA5DdTngv
 8h1WjQVAD89BwSxa/NvIDXdtgfAmuHMYS06G2ohPg0nwa0ZdKG46sZKraxHzrszVk5CcmzxcK+1L2
 75ZjUZarFYAcKqu/zc/+fBK2QRqQpHmh0nNxcP3am1SgPAMESIZbuDjbQHkG9+jU0G+BnNNRLY5V0
 fmRP2H9p9oxgf0KHoISK1pa4BsClatAJScDYEttnQDU/tJ2HaguIJxijzlRcGw3d1dYzCHrWCMvUp
 xuy1CTA7tP156koSVkl4ep+ASokE1fj3VZ6nCEN7ZMNScOM8D41TmpRExwpnJfgnxY8TdrdVoBDLn
 ROaVPglA==;
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5L7-00H9Qv-97
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:37:22 +0000
Received: by mail-io1-xd2e.google.com with SMTP id z24so20150596ioi.3
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=;
 b=dX68k/vqLQj7dEmcf+9f2n2EFSx4AmpIebAbLKUYMqcDzhpqHtyMUTDlaIANEMTQsm
 187GxMYB9OrBNQXrUvvJsaluMvSvkVPpAgNcjbmQrMAbHPDBpKlkosomU3fskO2L94+F
 srMjBjOya61XzRSzr6ZTQ15Juai3s2sPr3JfdrASXUTXuNglJjhDPyCGG1IEx+w2+r8I
 rb5kjSSUJZF1C61Gx5ydkY2g4qx9FtuYgDN2uHBsWWg2M+KQyf9dLUZc9sLu83O9gc1w
 3xAu0b+0WxrjaE5tTOGlMbzaEFgEEmEVg2ok+Rx1idLZMDGFyqCYaps1Iqj/WFAbc0rx
 j3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=;
 b=KkM0cW1yMF3En+cgjR2fPsEshbDZduhtfXrgE8hyEx9py+5PW/gxpL+LrdiAOYMvnX
 i0QEgGaSl4az6kdnsw3SA0UNioRWPlU6IZ2m3qlh55+6RdNcFi1YaHRdtA7nL3aSJtpL
 TFLf05uECY8CJpMa7HptVGRz/8J6oMVpBoVzPbV0FynCQ6eZnZCGrR1wRrsZmF9K9EaU
 xxswfgkHbJPokxdRIdjhR+NGOxVYZxSLh3YjGa6HX6xN0DeWE27XlAulqugnOliHwtX5
 7Pbqrov1RQtoipcMntNk7KqVZdihveeeJi8my6xzPIOSnxqBvoUY+WbxnJxOcjqW/nSy
 grsw==
X-Gm-Message-State: AOAM531ZUyUh1ziMh0u9MbRrRZMt5O594YuNYW2Qvo+8VGj2b8yRA22O
 tIth4rdlPKWgm7xw2mSBMNV7kfRiLLJquAEqodpVWQ==
X-Google-Smtp-Source: ABdhPJxErXiEqANMcxd2fY+DnyF8+B5zbKwXCw+ONC3YxWp9MxJ/qb64jURWmaHd53lAI1/HJu6xOy0eGOwj7DmXTHo=
X-Received: by 2002:a5e:8c11:: with SMTP id n17mr12081480ioj.53.1621604240549; 
 Fri, 21 May 2021 06:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-4-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-4-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:37:09 +0800
Message-ID: <CA+Px+wVAAg95YkB4nXb+Emr8Ce5GpfoHhUe5B4iUViRWdfVCZA@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] media: mtk-vcodec: vdec: clamp OUTPUT resolution
 to hardware limits
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063721_327480_A9B26522 
X-CRM114-Status: UNSURE (   6.88  )
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

On Wed, May 19, 2021 at 10:30 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
