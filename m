Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1935EC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3CF1613FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3CF1613FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mql5vzXnPiPIVb+03315NjiZQvuQ8YMpFjAVte4LGNA=; b=izjvupBrUFvi7ZnjVTiDXYxoXI
	SXlQEiSLB3oxiRAtlJ/gPppLkGddEQlIeouo7pBqX/iioyR+E72rNRtJrzBPdihhfosZFeJdN9bHT
	TcqI3XAt35Ky13TzAW/no1BMtUzzMOSUzHuGt3PM5EoZbfZcyawfndnARq28p4LDh49xoAHNEM5Pt
	hXg5EekjRtDdW8JcHLBDduFTVnqtG01XCDCfIhiYl/RUxOHBIST4T+l+tjTMl7kN157LlcYm1SvO7
	+2vvhM7ulaozbrB3wC7cpTNTGTBkY2LOTeyT99+Nr9MDXZpxHkhz8OFYXnolIaFA3r874lwGGWez1
	hAnSufDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5L2-005YVD-TA; Fri, 21 May 2021 13:37:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5L0-005YV0-I7
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aOxukUP4jIrT4sl1iFyJVxJdWx5J7pFUcynvJLSMuxM=; b=EpxE5+5OCL9KnaTFIyz+GVGgRo
 NPTQ66jSQuzt6QaQ8gxe/BlWEyOPv3qysCtzpLI13NbLVDbINTUecHyTjzlfqtcreU6+74Dj2PaJx
 qv3n0Zh/10bSflB9mQZmCyLWvZ1fs2CqKI1iLJTnymeQac6vgtGvTawYl69j+xwm6ihS05pJuLO2l
 F9iwiwAAqGe5kxJxWoifB+a9ainArv/wzMJpnE2r3xtM0BKs6yfaA675md2fPdxZ2I6YF6bskDPfC
 Azz4t4j6JvVB5lZyiquKegPHcg17gW2OZr0iIeymT6orL6174ndBZazbiw1iXMj3gf2abajrzG/u5
 drMpWOSA==;
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5Kx-00H9PZ-Qx
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:37:13 +0000
Received: by mail-il1-x135.google.com with SMTP id l15so13072720iln.8
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aOxukUP4jIrT4sl1iFyJVxJdWx5J7pFUcynvJLSMuxM=;
 b=c1dx51qHrwD5aaCshUIp6eeEm5WABOQk4ytjO09vCI4TEEK7opgsVS+XHPnEunkJ7F
 w13th/NxTytTPbVBSewh40x8g8OQx4xTpImb8PblIt6tAcfGRE13hTZXlP67q9qG1fgn
 QLhgjjB7gz0WDz3O4dZ/mDh/lkSc7Cvlg8y1J80G6/5xct40gLUMQzjEgoyOyg+X9aLC
 gYFPg6Msv/chUf67TngUnnXsk5g8WB/3zx4ECYOOiPP3WawGE77DBwTn81kYkcNFU4zJ
 2OdQhWbO5Nbl4nWXqaMYTUIbUXS72HUg2RI58+LZ4L6H5Xi2qce+1+LUf4N/TBqPa946
 PI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aOxukUP4jIrT4sl1iFyJVxJdWx5J7pFUcynvJLSMuxM=;
 b=KV96hnCrGHGfVDKlO071EfaRZ59izX6iMAEEkvkz8339BhIx1iunTLX0yAqPUrnkib
 kThpXkS5BHvXwUFf/6OwpF+tU0YxeRBrSH9o6LAzX5g76OKesfPzo+X/V6JQyRMIEelZ
 BpaQ4iJyL86ehIvT9cTO/jLkXIIsYi/KO/lsehSsHnqSGn3DUYHfOp6yUESIEoliEO7R
 wEI7cMeZNe0SMlemvsJ0LaZ/4kduLPox8UiKcE4HhHqFfOHql/Z7sjFStwJH3PgK+y7J
 yC7aURFYqsKCLt+LfLvU6HEbF32jOru2ium+ArdWZRexRxH5nc3tToNFVsclXvMA7FOV
 Vu2Q==
X-Gm-Message-State: AOAM5336YsJ3t9drDOEdwn4+F6H0zL5jiJjljr4pMKQ9EX0bKGiNfvBl
 VkGju/b6LOfXM8CRdrGD8OiKJ52UaFFKgSJsxKIVpQ==
X-Google-Smtp-Source: ABdhPJzEiyCios8dWI/Acg2dtT/0zWtA9aBNoDZXPirEUp2D/T+FjiXdNJf5mkQUXPKh50k3T9wd7lZpe5lr8WVOUow=
X-Received: by 2002:a05:6e02:92f:: with SMTP id
 o15mr13043037ilt.127.1621604229383; 
 Fri, 21 May 2021 06:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-2-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-2-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:36:58 +0800
Message-ID: <CA+Px+wV8_rCxH=OuwjeUsVpL5Vk5kN_BymA5QRjwhDOUn-iT6Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/14] media: mtk-vcodec: vdec: Support H264 profile
 control
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hirokazu Honda <hiroh@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063711_878449_834545D3 
X-CRM114-Status: UNSURE (   7.34  )
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
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> [acourbot: fix commit log a bit, move to mtk_vcodec_dec.c]
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
