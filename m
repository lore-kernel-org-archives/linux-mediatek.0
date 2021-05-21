Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18F3C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:06:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4581C613AC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4581C613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4tMVp6lKr3wmEmOKp79TrIkjUzGxyga/rmGHcsIIMQ=; b=MEPRV7lCDdM2Wl2pXgW8mVngEE
	zT4XNvXA2W9ivQocsQ84kIAY3hi+sJjhPtCpBm++59OwgFpcdrTzL2W3aBZLvU5vxMoMVdk6h2SR/
	4HYKUqFxPtITxqTiOc8kK0c/3IGdi7F8OHdiB3sz7euzT40UwvFSQgggSewb8+kLCRBXN9/321ANS
	XH/peKB0AP2cYzz5yDmGr1nswB++A1IaC/G6ot4KUKqK57PkPeNlNCFfR3Pp0bguVq5lSdzMQLWiu
	QjP6d11YzaGiYqxAjMlMgxQPljry+d+0AtF8deVbq9aiuGqKdyekqcVWoByZnoOSWLJhNlp9bFj87
	5a/1GFqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk0Av-004MeW-4E; Fri, 21 May 2021 08:06:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk0At-004Mdu-6B
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 08:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WAoGYY/IZ06EOl2sgqeBHp4au5PF0E3H2r0EKWA9o4I=; b=GYu9ETwbpHztMF/+P5F/n6LLqW
 Lnjx6McuuO7dxzwRiDQv0LWfGiaboaAVlqcOz71SKVyin8MIbvV26Ff8K7pWNsM/c5/7fVVBbw8kp
 ysOC5zTgXa/IL1kqTnnTe7ZuTwvf0iiAC1cUh7T2Vp2VER5ryp+OeMPPL9001zeJONkeN3zm6KRv2
 /MJD7egBkzy9QxpZSZrenfv5QQDTDpllX248UDPqxIZ8OVgw5QREvKmbr1fjgJ64iG6LBb1wT6Kh0
 dDFEaqWQjEUuDtOMPiibIbyuosKrJd/X3ZwFS1QtG6LnmyyjUHGs/7dZ5cPaqP5uFhI1veVahtmLs
 iapN+Vhw==;
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk0Aq-00GvjW-N9
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 08:06:26 +0000
Received: by mail-il1-x132.google.com with SMTP id l15so12344991iln.8
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WAoGYY/IZ06EOl2sgqeBHp4au5PF0E3H2r0EKWA9o4I=;
 b=RSqrkjnpNv3xOnHZ57xV85Uq945ViwHco45Lb/nK/s/aRNbcF9pCLsb4Y/mHIA3IYC
 Je32opFAc0+tjj+OFJinHjPHi+Z6Eveu98JACjdv/T0YIZTwGfNRfn7QoGIU6u0xBgi4
 kZo5mUmgF8CHehv0XiTKyEvKYc3YNgsBDXDqbt+kjVgG15OM/j8KAkYcu+n2T5Os1kyD
 Agszq5EsRdHn8bEYnTwe5g9ZABpyl2rZxFP9/FXYrB10YlXSEICIC4Ov2ahNXLmk9rhP
 4D6bQthjeF7dN4B8gfI0pGsqR0GP8sWzQM0lVItc/wBdFGwnlSuFFl5ZbnMiyviYnEL3
 lwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WAoGYY/IZ06EOl2sgqeBHp4au5PF0E3H2r0EKWA9o4I=;
 b=Gg6q46+rz/Kx+uJsCZBLCZ4yHXibQ9zHW6sbwGpUEXJJ3kHAbD7UCoXojP0/xz9mQy
 Xso+n2vm8IEvAgENv81vkNKFIBkxkt7MoCEp4K20v1BPaYqj6v2nIXP3NW8248vTM2vq
 s4cNUGq0weZ1Kjsjbj365EFenvT3OFaJ5qnt6TwrBAAzwmo93rRYXqOucJxuqMj3/uGj
 HVlkfP3HeAP36kJdFY8tpOtzz7xOA2k5EgcAe6t0F8kUnM2ioCN9DCWR0w6M8GTeIFtX
 Qs/1VbwaR2sd7O8lcLI41n6VTKITPiQwr8dGdlIO9J6Yzw6lQZFNcVK8N0ajm8NPLARx
 s94g==
X-Gm-Message-State: AOAM531v7aBoiAAuqk8Lc7Gillcqm/Z3unRMUP6vfLikpuwPy6CP+wS6
 pmZTkQrPEAABd+WNEVoPTgS6/kc0cD6AsZPLghCiaA==
X-Google-Smtp-Source: ABdhPJw3h/Rdza5ih9pjbFjbrw/o2STJYHbm+xddgxIMSH3QaWhkLzFTbyk3TsjrO8vCypKIDZQWFwj1Tvz/HMgWS40=
X-Received: by 2002:a92:520e:: with SMTP id g14mr10448898ilb.218.1621584383431; 
 Fri, 21 May 2021 01:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-4-irui.wang@mediatek.com>
In-Reply-To: <20210521070139.20644-4-irui.wang@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 16:06:12 +0800
Message-ID: <CA+Px+wXkn2ih0JdgKBOoHZU1=QqO=vE1MAP5tauHvRe=rtjg7g@mail.gmail.com>
Subject: Re: [PATCH v4,3/6] media: mtk-vcodec: Support 4GB~8GB range iova
 space for venc
To: Irui Wang <irui.wang@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, linux-media@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, srv_heupstream@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_010624_765724_9F659339 
X-CRM114-Status: UNSURE (   8.61  )
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

On Fri, May 21, 2021 at 3:02 PM Irui Wang <irui.wang@mediatek.com> wrote:
> +       if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> +               dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> +

From your previous dt-bindings patch[1], it has 4 banks.
> 0~4G; 4G~8G; 8G~12G; 12G~16G.

But, the code treats it as a boolean.  I.e. 0~4GB if non-existent;
otherwise, 4GB~8GB.

[1]: https://patchwork.linuxtv.org/project/linux-media/patch/20210521070139.20644-3-irui.wang@mediatek.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
