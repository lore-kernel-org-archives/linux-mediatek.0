Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3DCC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:06:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 619D3611AD
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 619D3611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBYR3iYs8XPynE5lKFPZN/b01suWAkZowj/D2McwJtk=; b=M5P3g2RDxk07lEe6POwC2IN4wQ
	esk2eiz3OVTjeK+gV2jAfaD/+f+HZ1asnsu8RjgIovLH27tHM/zBECRQtc7CCmbTnPzj3uKhhmImG
	KJpjpoSwGbqY4UX6QdOTjrjgcMBJGD+vykhmG4ye8BNppBFCPBh604QAZBmRsikOSZdn5pme02TpA
	lswQlol1FbN35G7V3/DHUICk7KgAnd3EQC7ZOIVVqWVsAVs6QfvSo/6qLEb/qYxCNrEg0TJ0a0r8X
	u8m9tZByQhhvLvslci3QBwR61YCgecnxsY703xiFjkjmTOlDrp7eAP4l6EjzmU8hmPn6wgJzpGwvG
	XgNuxgVA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk0Ag-004Mcd-7r; Fri, 21 May 2021 08:06:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk0Ab-004May-Dh
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 08:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nLgutOYMl1GMr2L+DWd3t+nM78vyp11ue7Ti9kGh5WY=; b=ve56MKRsmCGvzfQgIi08DkFbnx
 RL3ryvJ0NKDsqPoc8/oJq15beWb/URYEY1f9xDhtc/vUMgw1YT6Kjb2ht5pwkRHsjsPMSQxXW2z1P
 C00HLh4o9LNSkVsOl1waU4D7mzeTMfAqaECK8udIub56xhe6/d8+mRCW6aMDW7EHrcgoVLHikzNRl
 J8E6WIrqccV1KSNmD2OVt30vmagzRAK/iLmOUC7g6gC/IeLy4ku/rr6iHi1hKkSc7ZVWydxVRLQdD
 qC+ZYpWSXCE8KT6V2fctd6Z4DnXSDolxUBwUwZMi+l7jkFJDhTvDFFCcIzOxdWjU+auyAUiKUJRGx
 oaCWP34Q==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk0AY-00Gvi0-Cw
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 08:06:07 +0000
Received: by mail-io1-xd31.google.com with SMTP id e17so6755484iol.7
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 01:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nLgutOYMl1GMr2L+DWd3t+nM78vyp11ue7Ti9kGh5WY=;
 b=RLCkpSbUTDgmL0IUkNKkbmahQomlAqn9LVv4OjtlEGPKEwf/we89iYS8PkEh7NMqj3
 IAneffvJZrHAvht8if9QuBmdyHhvk2UDoSq1UvZpkI8SQDeMytix6Oq+ys82P4DA7qNd
 I3tazjWsnnIEfHimQYEFmcdmjmKEylDeeam+tOPNbq6OKawmBRtMkgc4/ai1bAA9Gmus
 Xe8Uj8dpmbD22hxVasY9Z+UH9ixx3pb0kr09WVsc5qI3+fYKN7JLXHncK4ZnUgmOonEb
 bWzKeZtQtZncb4z1KUPGbi/0rpc1JLKRSYLFNhFoV/XFQtYRwHp66ut8KjOGy/mVAgQk
 qJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLgutOYMl1GMr2L+DWd3t+nM78vyp11ue7Ti9kGh5WY=;
 b=qpi7Tn+sU5fi++NPk+u0dVgiCsuUUFCk+c2Uz5uqEoPBO078n7NCYQ0luRFAQ3cdBT
 VdpTV6J7leQOw9QvZYjYSb/LSucUyhJrbc8hjE8lDuE3M49NGFBwgS3fXEesf1jBWQK4
 C+n8afpcvQa3J7efARP/vrjNVCvVz5lLtn7HEVz00eX6Csudr2Hdo4jKiTf1A7f8somZ
 ZoeT8CauTveh8h/kWJKeA0QKROAQjaEJs/yqtofq5a/YfVCCAwxpxf0AkJjySozhS29S
 4n8okuy30sHzUvj3sCNKLFiYj7PC97ekLNnnix0Ce+aSZSf+yoNT+e36vIKZq/hl8+oa
 aydw==
X-Gm-Message-State: AOAM5337sxEgjmc7yUvzTFNBtfAHz+INL4UN8JMvs4fsrYz61R4Mxjl7
 GXXg01R1pFbcZpQd6szI/9C/A5FO5CdaQkyiW6WsAw==
X-Google-Smtp-Source: ABdhPJw8QQBmq3fEOwfOK/ErgYCCLNXidUnXXUKXQuBmy4OkSx4beXK+d27kBMvufIEEpLJJ2b2A29KuaUHg7Fqdpzg=
X-Received: by 2002:a6b:e00a:: with SMTP id z10mr10832250iog.109.1621584363791; 
 Fri, 21 May 2021 01:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-2-irui.wang@mediatek.com>
In-Reply-To: <20210521070139.20644-2-irui.wang@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 16:05:52 +0800
Message-ID: <CA+Px+wWzRHP1mdG57UDbT7_A61kT7Ef4JVVtjey4quFXq=PebQ@mail.gmail.com>
Subject: Re: [PATCH v4,1/6] media: mtk-vcodec: venc: remove redundant code
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
X-CRM114-CacheID: sfid-20210521_010606_445497_ADCE2C9F 
X-CRM114-Status: GOOD (  11.60  )
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
>
> From: Alexandre Courbot <acourbot@chromium.org>
>
> vidioc_try_fmt() does clamp height and width when called on the OUTPUT
> queue, so clamping them prior to calling this function is redundant. Set
> the queue's parameters after calling vidioc_try_fmt() so we can use the
> values it computed.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

From the guideline[1]:
Notably, the last Signed-off-by: must always be that of the developer
submitting the patch

You should provide your signed-off.


[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
