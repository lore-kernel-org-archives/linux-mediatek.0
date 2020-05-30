Return-Path: <SRS0=uE9q=7M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD0CC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 20:34:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA6D20715
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 20:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tt+tqn1Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tRI5eqJP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA6D20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoPZIHhOsKdDWysMglvT9+mhEcAxQgvg6bvuWN1xaCw=; b=tt+tqn1QEbl8Xj
	W1dclTcBGLxsbA1sxRCtx784dgk2nQ5ZQfiB42DunEmEE9EB10QEns+sc/7wwGv0vb4gAOEjUn80q
	Ox2ich/qoz5emIUpz/xOwkuUas+PpElDWRuOrokA9QcGAwG+6WgdR6/wSsfL8QDcQ7Wj3kPVOjU25
	lt7z8MuOM7rx9V6Oxt9KTjN8fhBFQdz4OM7ORibYID2y4hOnxzuUFapAgzSyernh+4ibXf0ko/JVx
	w2XNIWlgquGv3dHSiy520D+bcshuhm3qm2mhSYOnhWCQDu9Jv2q1tCKjiBxcBbpXFkqUISrw3/yPO
	CVunSNGlhmrfgwbROPSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jf8BX-0002oE-Fw; Sat, 30 May 2020 20:34:27 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jf8BT-0002nn-TY; Sat, 30 May 2020 20:34:25 +0000
Received: by mail-il1-x141.google.com with SMTP id q18so5836684ilm.5;
 Sat, 30 May 2020 13:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YQ2eTRzHonhqJF3ZL4HYlMxSElcEqq+WSqbBmVWDUhI=;
 b=tRI5eqJPiHGaD4J0PlwEJbmOeTLTXvBVFiz49/nwb9HvI5FnUEIWpISRg9S6usOTLR
 ffjIu5AyTInmZJSpqk3cYkRMkn2P3lrBCQMiKvQK9WWw9oL1GOJrqjmtVQswiAu/xDMm
 hDx4qaoIjbgzSphtSas9COsc7e2LLqSmpg+k3o96kHelcU4kRlwRrb340EL7oH+vH7JY
 PxVflsJi0fglfmwXzpVLbVAPfgnolwiFXei2OZkWTU+d61+z/hmiHEwkb0T6eoZi1Cm3
 X03Igs/+fdvJU6arMWAXoecFr2s7WzdyRLFl21ZmB/lktpRTGHWuY0GQs5uCk82/RoAy
 f+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YQ2eTRzHonhqJF3ZL4HYlMxSElcEqq+WSqbBmVWDUhI=;
 b=og/wvf/S2tcKGT8ia4FiLueLFGS9E5Pioo0xpHPR3HuP7exnhb0rh3eX5Iv1CESoFm
 R9bbPDq3UvrG6/8bYXWb2YdkJRLJspFMaxEMBGjsBi4NEup0WIVcLHwhFWjPB9AaI8Zp
 vOyWFlZO+oDX5RSsCwW95iQiu0Zv+PRAJi7RbTktjbrJTjgwWAuTNQo9mA16ttSOmwwV
 l7RIMorh9HQnyWvJowpnFzRtBG+falKnMhUEN4tI7D+JpaMhkA+Xe3urZ0pO4YOh4g69
 eBNjrj87FUGP04f/5cNFJgRfaNGiLU3cL4mkP3w85E3J+YySRMyC/D+8QhTrb7hKi0G3
 msWg==
X-Gm-Message-State: AOAM530NapMLfms+5ReiFbM2dQl8aTi4FaTJ2thxEIOPAHmaSCn53hlC
 zlKpLkROtK8z/C5dFDY601/Y1mByQAF27I4lPeI=
X-Google-Smtp-Source: ABdhPJykT3ennuBwiv4teUw8fHN2/mAUZtgeRiRVpY21O+TfXGVZ28jkFKhCCaxyiyHA34VHj2THd7C4qJbb3CjaPz0=
X-Received: by 2002:a92:7104:: with SMTP id m4mr7655023ilc.87.1590870861509;
 Sat, 30 May 2020 13:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
In-Reply-To: <1590685491-17107-1-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 30 May 2020 15:34:10 -0500
Message-ID: <CABb+yY16FzgafSYRo8DuVMttqUR5JVzXDsaP2rX+UnrNOD6k2A@mail.gmail.com>
Subject: Re: [PATCH v6] support gce on mt6779 platform
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_133423_974401_03A181B9 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 28, 2020 at 12:05 PM Dennis YC Hsieh
<dennis-yc.hsieh@mediatek.com> wrote:
>
> This patch support gce on mt6779 platform.
>
> Change since v5:
> - spearate address shift code in client helper and mailbox controller
> - separate write_s/write_s_mask and write_s_value/write_s_mask_value so that
>   client can decide use mask or not
> - fix typo in header
>
> Change since v4:
> - do not clear disp event again in drm driver
> - symbolize value 1 to jump relative
>
> [... snip ...]
>
>
>
> Dennis YC Hsieh (16):
>   dt-binding: gce: add gce header file for mt6779
>   mailbox: cmdq: variablize address shift in platform
>   mailbox: cmdq: support mt6779 gce platform definition
>   mailbox: mediatek: cmdq: clear task in channel before shutdown
>   soc: mediatek: cmdq: return send msg error code
>   soc: mediatek: cmdq: add address shift in jump
>   soc: mediatek: cmdq: add assign function
>   soc: mediatek: cmdq: add write_s function
>   soc: mediatek: cmdq: add write_s_mask function
>   soc: mediatek: cmdq: add read_s function
>   soc: mediatek: cmdq: add write_s value function
>   soc: mediatek: cmdq: add write_s_mask value function
>   soc: mediatek: cmdq: export finalize function
>   soc: mediatek: cmdq: add jump function
>   soc: mediatek: cmdq: add clear option in cmdq_pkt_wfe api
>   soc: mediatek: cmdq: add set event function
>
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   3 +-
>  drivers/mailbox/mtk-cmdq-mailbox.c            | 101 ++++++--
>  drivers/soc/mediatek/mtk-cmdq-helper.c        | 163 ++++++++++++-
>  include/dt-bindings/gce/mt6779-gce.h          | 222 ++++++++++++++++++
>  include/linux/mailbox/mtk-cmdq-mailbox.h      |  10 +-
>  include/linux/soc/mediatek/mtk-cmdq.h         | 125 +++++++++-
>
Please break the patchset into two. The lower mailbox related changes
with soc changes on top.

thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
