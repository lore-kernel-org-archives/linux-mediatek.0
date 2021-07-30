Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70BCC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 09:32:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADDE603E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 09:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9ADDE603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcfTzhoo2UGavkSUrEgHfNIPgwML0gZNl+0vkZPX3/Q=; b=nKDOiUDSZt390t
	GpkXB/7Ap6UEtoVxT0h0/xEfaOCITNbBm9lfX9yo+NcNmm4zHG8QAb1kYk9RCWiwlAwWBc82wKQ5g
	MwUW0KhAUYDFq+njHZgyfjAWe/LxcTj8zmc1x+iR0isspvifo54aeeOIP7VT6b2jN13elCOJB/ejR
	SUDvIjx5M6odoKO5fxfeb2pX8GQNSfDJXB+xwpLDr/M6Ft5vMn9aSYEm5tj1SRk+8YHUVQTk7njHf
	VKNdgl99gUnSRz+AcD4vLMW1NQkFdM8mJp700gEsI8Anud+rx68+wyK7SLCnJkNnYcNHJGPLDxJWS
	UcIJouGOCiwNNy7ec/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9OsT-007ttx-R6; Fri, 30 Jul 2021 09:32:25 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9OsF-007tnL-Hq
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 09:32:13 +0000
Received: by mail-il1-x134.google.com with SMTP id r5so8716710ilc.13
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 02:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QKbni/aqZ76egtkhHkdY0UN0LLkLh5aeXXQeCasUkGw=;
 b=tsJk19gj3PkHmJlHLJBetwd4R6wBhJLLd/jqdoeSuniGamNJhUloHmn9Om5S6Xtb1F
 aHESwW0AAwDpr4rE3MHELlyFuZgtOjXswiUzKTi5UF2y8bQwaDTccAtbqBTgdi6k0uLp
 Xom+icaVuL6AmjU70Bs9WjQ00OyqCm1h5XHAOamMUzKmLWRIed7TJ97AsvC9QLS1k8Bx
 5Cjdoq4OAW91rRhW089foyTtOwVoRPQ9dHGYvFquGDPqo2eg0PsC7ooG2eLZEZIv3WNg
 vnuuBvVUnz0q5RFoU0Wale42c6jGEexWwBqS7Lb5bc4DJp2T7EvP8Y7znE1E95N+K0oW
 JxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QKbni/aqZ76egtkhHkdY0UN0LLkLh5aeXXQeCasUkGw=;
 b=l03XPV8lW7W9XhHMlyuAJ2n0AuRZYu/IkXrxT+I25CyoZNldWKB40XAFJYFWumIsqd
 A36d8kglyiF7gzDbCKq88JtZwF//YqxoAWzaqLNiAXuNys4kNAV/bT3IkuylsKXq0rS/
 NrZElKR/7WwpXcu+QtNw14OgP/oyZjqu/xTmKrD9S+XoX9Dr+la6bVN2EJhkrZ5nrWEF
 5uYp93oRIjkVObm38ME4fwOL6jhs0CzXRmLaqes+57TXNA/DicnF2XdqWy2QqI0VXJvO
 UYeDGnC2xs22X+o8mAXWq7rWIfyDAatqQmoZ0myTMNBpz9LKnSCgdxzvgxsVLhsMpKIv
 Krog==
X-Gm-Message-State: AOAM531toCtv61qv13/o213YsOUBaz5C9FgXNZJFsN9BlyKmZ3EFE58G
 1ppT5LD3DDrfI2RPgEhUxg+9exqV/0W2V/fTHkZwsg==
X-Google-Smtp-Source: ABdhPJwZLOf5Uom5UUNk1V2tXMhgVFLbgGGQQUfIB7390G3ZNeOxSBTJlaBusk0ofIKvM2BK/hKZ296u0QH3MGgaERk=
X-Received: by 2002:a92:b748:: with SMTP id c8mr1288763ilm.302.1627637530193; 
 Fri, 30 Jul 2021 02:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
 <20210727101051.24418-3-yunfei.dong@mediatek.com>
In-Reply-To: <20210727101051.24418-3-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 30 Jul 2021 17:31:59 +0800
Message-ID: <CA+Px+wWBWsxL=5_QYA6_v18uuRwFyoO4gT5CEL6_On4GeY+jag@mail.gmail.com>
Subject: Re: [PATCH v3, 02/15] media: mtk-vcodec: Align vcodec wake up
 interrupt interface
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_023211_649684_7CC79CB2 
X-CRM114-Status: UNSURE (   8.49  )
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

On Tue, Jul 27, 2021 at 06:10:38PM +0800, Yunfei Dong wrote:
> Vdec and venc can use the same function to wake up interrupt event.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
