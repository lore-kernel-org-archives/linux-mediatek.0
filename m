Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99047C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:01:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DCE461A14
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 11:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DCE461A14
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PLJqOxA2TFZ5yLTQTDqYvIIxlDR523tVInoUS3+JbM=; b=xcPpF+TkMTEJtB
	KHbXvjzFmM8blVD7o/FSfzLGH9JM8U24yoQRltUxzBp+OAiNmdxfFOfjs9avZC9XMuI9zDBpegX4/
	uEvOSWGnKs2OeN20gTu0IZ8RkVE3F0TGdo2ygjUTUr2g+9oYczCWYZY3yk82OydWkt2LrmQNKWUDv
	exg6yzvY8WQA30zUGB3TWlaBwM2VoTZSzB9HZ4bOMsfOjy/3M4CSnbLw+0KAds19jnDP6uZchd+AS
	Ge80A3tAstJ0Dz902u3pfPzwQYTk2Rs9PiQHUOEdE5bo1ydIqd1YaSXGC1x4cqy73pQpVruYHxfa6
	ccDL2u2RstSBQik06Kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ipH-00B9F1-03; Tue, 06 Jul 2021 11:01:15 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0ion-00B8zT-Oj
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 11:00:48 +0000
Received: by mail-il1-x12e.google.com with SMTP id g3so18889975ilq.10
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P2F0q5cZ9T+aDZo1I+E0xv2Xq6Jm2e2tnmFxq3cllbI=;
 b=tCQM7yBc/bQ13X5waUlFbZymap0CF6b6FUaiEV7Gq8d2wIyBm4a7rI0s/XybyekfEO
 qga43qmEuv9trvJi/Ti6iFVmocWx2eINCikZOweZ1cJ2RLQSWi4OGXQLwxLSpYZWeybE
 AEJo8+NzojUauT3afjB0gfSsVK/NH9SdwZy2Z48R8ELAFrK86ycUo/RQ4t4tFscY8FYM
 RN304eIOMjMENMfhw0zzcnLanc12KMt2V3jAVbSiSDlqQpSTo5G2dj9GzXDHES46Fz7K
 ZuJfJb5ranuW2mMC+SBAmlwQLfx42Ax410mijiXeBkv3wEx9/mwLnUarqg0WNFUTlEB0
 nt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P2F0q5cZ9T+aDZo1I+E0xv2Xq6Jm2e2tnmFxq3cllbI=;
 b=Ts6RAeEwDodhDWEenmsg2oJJDr7sePo7yZr0SXnIwkTtudZ8LaxyKNjLQes5bZG95H
 +O+Yk05Cn45QuM4OJMrAiU5T3DT3X/UPB3mJT184fnT7OdEoOc/oEYlOBIvRfJptuvK2
 vsdNG0Um5wVhclooWPwr8pSm/5cBX5X7N8cX1YBKebanep3025T3ZpWkU7S28KLdtKMS
 nGlv/BaRoF5j2sHKYUHt5q8yQHWVSq8Y1AyesSEVmhMn+Pn+bem4trqnqQaHaAxIpKlF
 yFYT3N1VMu2UtbYGD0mlq54DhCQax1NtbZPSYcoVRpLodXpCyDKGFdmZOkVDSEByRbXX
 FS1w==
X-Gm-Message-State: AOAM5325i6tJWSjHTDQfJG9dD/upw868ATYqBepSdfmjAgnHAiL3DigW
 w5YXA9nq+bQU8c4O0nX6YI9QwUqmoEiEZsSXR4aOrQ==
X-Google-Smtp-Source: ABdhPJxrPo4pvRFB799x153C5Tr+j48o7WaiBw2A0cw/K3H5RqT0t6YjU2ISyDzqXLYFdafdRoUc/AEvCMTHyEXE5bI=
X-Received: by 2002:a92:c952:: with SMTP id i18mr14007199ilq.218.1625569244459; 
 Tue, 06 Jul 2021 04:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
 <1625038079-25815-4-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-4-git-send-email-kyrie.wu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 6 Jul 2021 19:00:33 +0800
Message-ID: <CA+Px+wUPX0My5+7gBBo5N0Qf4VbpK96=vS8_F6xrRt+-T9O-3g@mail.gmail.com>
Subject: Re: [PATCH v2,3/9] media: mtk-jpegenc: remove redundant code of irq
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>, 
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_040045_876584_0512A5E1 
X-CRM114-Status: UNSURE (   8.21  )
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

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> the func of jpgenc irq handler would not compatible, remove those
> code.
Need more explanation about why as I believe it is non-backward compatible.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
