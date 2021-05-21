Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A234C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D8861132
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55D8861132
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzdjtXadH5nCUiVKoBdr0ksjihkLFesCD+SqHXLXbAI=; b=ntREPBfLVM470dvV5YNJsoXY1r
	G2XhKpsj40ukZMhfKJzqOiZQVIKzrmmATrv9HFdEFsIvBnrYG8+yJdVn0d23cY1NdOgDC4JkDA5LV
	MW4VMsEiLGhqTMgsgGmWoxzaMOGLyLrxIrumTvzth0+pY/3RZ/9+T0auy+JTKd7sAg92ffRgfjVPm
	+txW/w9Q7aUR5dF0Psebj1kLEHtcAsyWPIRoe1n2NRlRMWa9bwVJ3Xdi43V19MJx+Z4jhtjGXxT7V
	vPdf/enqMtJc1wTKUiKG09p/hDpukgnJgd8pm2wk1zvDrKqN/okeLcgYjJV5zeJjSxIjJ8FYvkKUR
	t1ogzfiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5Ly-005Yte-U5; Fri, 21 May 2021 13:38:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5Lv-005Ys7-1K
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=; b=E9A5L+uJVotxoQU7Xpmiwl6rXK
 M/OtgtjsZQMTlWZX07GAtRgrXd+djnCDekrxa6S1PioYYavFlx0V8h+j2ElJ31a6PCFX1j4HkBFQL
 vXNWM3K011Yj6TSP/ckg/lAx8Hhy35BPyig4vSxtofhnsq/lHXAcZoM/xDOHYDnSbOTPgnxM2dO5K
 2WMN+G6AHHop9uuXXQUCWLr4bW9EV7NhFEyfQPhDpsdwzOv2zPwVWaJ2VvADC6jRN28ptgyme6j5d
 Q5ZzCTFgdgtw4+wrkarrDXT5ixownApXaHZoTgt2dgpm7zlG+MWBfrXUKNa08su+B9vcHA/y95vae
 r4i9XuYA==;
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5Ls-00H9X7-OV
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:38:09 +0000
Received: by mail-il1-x12c.google.com with SMTP id o10so17259031ilm.13
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
 b=sTqvwAiaNQ4KCzK/vupskNveTsjdzDadubdftpH4LLYWoPKuaOdUIo9U1xR5EVxbfJ
 TRLkx3c8jK0PiM4IdWMl2eV+ZvnlcRKceTqZyBzMfE3/Fr/m83BxCdXZW81oUsRMgN9Y
 NXxToywYDx+qZi956HpmR30FEbygoENjpDxQ+uBBvk+G//rz5LQIPbiqGenaIeIpQJXN
 36IGvQRdFdKQx1P7EzP+Sz9hHYxU4fXiyCP5vJshd3WlG6nBK5zk/c3xjwov/fazOHBv
 IS8AM5XuSQqsdhzx8I43U/SEY2vhO66Se9s8PSKLbPqPqbxfceokm87MEZGIv6GMPNQ9
 x9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
 b=Oh460mrXiXxU/lc2F4B+oALKGz9yJOzIsoz9c5dFd4xD9mT4kQAvmya4yRQOvQ7lA/
 lvmsYjCPyDWZBYyLKonCvKv7t91FedZgQ9f52kqZyf8AX/h5qPJnTJKw7CjUV/G/uZeo
 HWnmb0YAYMOpPdcilSBOso/iNnQpg+lO+3juf6ODk6YIyClL/eZroHoHDciYGwC6MrIW
 0MLXZHfn1DvanML/RGm+FTDn5P23YM7bmtnZ6Nei/kc/Sllxp1wLV27hHNZgSlegkJOL
 z+z/BdlnSwLoHon5vEWVXrlF9nnmt/VIk5GaSIl14loIJL4d/SDsdPX4w3jfTkNwpVJ4
 JGGw==
X-Gm-Message-State: AOAM531eCX2AOcsxWkDrSocUtFJSO7h98v2Y9mANilKG5avIhjIbUi7T
 n6haOp8FAUU9uGy18Eya+wH/QzSJS56/d/Y3c1VZ6Q==
X-Google-Smtp-Source: ABdhPJyaUbZvDwXtgI8l9+6HZmWpDoF/OCiE7D7LSvdnS5+eKPt7Yahz2r1YfmK06EAv4U7WFj6Zg7fgKtIaomcv92Y=
X-Received: by 2002:a92:cdac:: with SMTP id g12mr11540753ild.72.1621604287338; 
 Fri, 21 May 2021 06:38:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-10-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-10-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:37:56 +0800
Message-ID: <CA+Px+wUXfT-agqaHB99nabLXeGxP5UCNRt0nV+wx+=vF=YcXAg@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] media: add Mediatek's MM21 format
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
X-CRM114-CacheID: sfid-20210521_063808_804595_EF93535B 
X-CRM114-Status: UNSURE (   6.68  )
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

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
