Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFEAC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC88610CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC88610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtL8yd3fOtcZwI9T1hBhuMugLxP2KuqIXt9iFx8lRA0=; b=YvzIc/FYSERvwr6ZYQ5TeXSnR2
	c0bmWMun39ub5wZbNr/h30ZGo8s4ASe4DMiLEU9QHyGYZ2E1jZIgb+ajDuvqXT2lNNeyFcnfzid05
	0Frp2q6baZICZLa9tKQW6RoDvXLmTO+5EQTVwhGjTL/ugwizH3D73IF0fHNQwjzh93S4VUflmuHru
	IA7ZqIXd+MXBHoYHfMNE/D1hXA6kuTZhpJok6xqUydZ9jIes67jhq7s175u0lZJV82SxFvnHe0ADi
	ke/+1Z2LlJIpORHE9KVL0C1GW2tlrl8Msk7fqGtlghGxd15O3q6fauTnKJIMnrIoGQkqICqsyg9b5
	13kWrKDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5L6-005YVz-6b; Fri, 21 May 2021 13:37:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5L4-005YVK-H3
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=; b=kY7FeoWJsDepBM24qhJPkFcTfH
 R/FDFauUxtq6+wlL/5dkgFuoHCWTAQiB+jG4DMkjmihid2/HYQ2mjSQHSU27EV5ToVS+FrE+Mp99i
 i469Za3UB4c8FnhOgdL6QUC1ldNoxaiHDVtRKgfc0HD5RV+30wSjOYqGosiIJru4vYOFYVhhGgrcJ
 u29b/l07u57CzjMOrdSB4J1eXn5GiA+J5qVcc2C03zEqIddzoCwAX/OnXJTgZcXyXJjb/tvIB0iCb
 rmLwsbYAkPZM/PTaVPVEQTncjJ2IPc2XmQJ48Bl5Vw6tIms/FNphOP2+sieVUXppxUZeVmhaR0WYY
 Yq+5iOuw==;
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5L2-00H9QG-5Z
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:37:17 +0000
Received: by mail-io1-xd2e.google.com with SMTP id d25so8357623ioe.1
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=;
 b=aNjUpsBMwnoOWHtnNBd+eSQErCc858AmiFEP8AvYFaSagPhuT2fvH7rWkwTQrxL3Ul
 fPQuXIHHlGeGl/q0PP1aGI95i/ejhMMhqyZj8xZ83N5Gi5u4DwSpdQ42Kux30GWa0Dxa
 5nutkCCxQacYk5uzd8c9V3OjMbVMMkdZF7/z8/u1bl4RuxT1AbCZwCGAHwK4Bok/smgf
 HPnOFo21uoQlN5DHATaQBTF/titNesNJzFGRuMT1Kn88ZNy7LAvqXKy6krOEp/HbkBsN
 WuDy6oTZ+TpSRrV/UIoatZ+O2o+lvahPUFfexxgnME6b+6Y3p34HA3eCy2+umxnB5ZiS
 NknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUwH+KODosjJUjMPg9IAKpCYIeQTuD5ncp4ytmLDie0=;
 b=nSUX9QHOPTX8J/f+LLnegUKHOMnX7ljrt4KNDwMnd4Oixjl1muPby+ffBaAfvLUfuL
 EbbMjPM0xfHMUL+YZddVqcvkTF80FzkOS6AAcfSs4zHuZnsTFtkZ605TRHijmmHjmsxb
 uv/6JzRlIimTGUpmszQNmtQCKMHsd1XHUqiNRvev2rgFtOeJcxKodSga0a+DJwjLAiG2
 6sirt2O5jtQqfvlQJFcCJP9N7Jbo/PauAjKoqi6pSLqqgtZT+cF9F/Fhor4X5T7ZEJK/
 E2yn6ikl9iIlKTgBgjOShmEVop1v1TB+jxD2oomRRAJHYdq3lxoAZyGBKVuVI8EUIeRi
 m+Sg==
X-Gm-Message-State: AOAM532EW+ssmMtxQg6Lb9kJG5nHjLJ4hQWk74hg4AjrBDNhnMyaEaNM
 MQaQvdqz5RpTaC2/3ZjEm1tqTjNh8vugw1EEZPH3kA==
X-Google-Smtp-Source: ABdhPJzYJYUU4TXfu6NnTqNo4nok573ifIKYNvqaNAYKOX06Pzb5kUyxROhQJWDiS7PsLu06XjkoCqwZdt9bQjGdtK8=
X-Received: by 2002:a5d:9744:: with SMTP id c4mr12255133ioo.76.1621604234778; 
 Fri, 21 May 2021 06:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-3-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-3-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:37:03 +0800
Message-ID: <CA+Px+wWf0JphnZOMLh5d0Q0DP-b32Pk4xzTE9cADHEXquUsLhQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] media: mtk-vcodec: vdec: use helpers in
 VIDIOC_(TRY_)DECODER_CMD
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
X-CRM114-CacheID: sfid-20210521_063716_216416_91E22D75 
X-CRM114-Status: UNSURE (   6.77  )
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
