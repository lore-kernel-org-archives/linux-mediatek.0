Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753F7C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 08:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFNWZX6nqcPRLAP3+p36POBcq2PQuLvUG582lwuLDsU=; b=QaY6TPX8ldbgxdBeibyoKcCZ3D
	731k/dC06cj/k+HBlnrnS9Uoc2OBg3F1gHfyAB693Pi/aiMISOikqTkaZ6X+2OCZF9WnJNzEdlGo9
	JEpwHdNm8b0Wf6kURtnr0AY88xWZvplfKnWKfPMArmMISgE8wbTZZoBkJh596PN0Y/Qi2BLFbS7ZS
	4PN8JNg4zDTyhJjt97EEE51db64yoW3gwDQDqkGAH2oCAbDJD0MD0euUFDlSeeZ0CHp1vKGae3nEW
	ca8wxrDa6r/ZybgOl9lKBlcbLxRfMYm/+bvGrosb2p+5ZCetXzNCRN2Aukl3JeqJvT94ibFVRU4L0
	Ul12u4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOk2-006Jdk-PU; Tue, 22 Nov 2022 08:34:54 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOjz-006Jax-KL
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 08:34:53 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-3876f88d320so137469697b3.6
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Nov 2022 00:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFNWZX6nqcPRLAP3+p36POBcq2PQuLvUG582lwuLDsU=;
        b=LQ3kFeWQ2ww95B+4OGM/Xi7/EhnpNDt1EmBmwI4DT0yUXiW6umbD9hx++bvotDI8K3
         CX9Yix/41xJH9FKCIELQkCUCRfZxBZrgPQqQ1OV9qCn3RIAZaQNnEkjQGyfVVW/7leQk
         hjzkwVSOKuILe7qujZovTjJBAFnjYaABa92WQkUVNY4ErS7bfEbTBeNeWjewcpZoZNTY
         zTcwNKruUOGSTfcHRvypjheI1dWtxsxaNdJJ97yirVI1wOImVd2TCcV7TFzRa8cY4UtS
         1KQ0eid0pYmANe+Pu3gcXhXYOCHwwsyWwh8g0M1joaKs3+STGH5K8ujgOUyU82A0URV1
         +P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFNWZX6nqcPRLAP3+p36POBcq2PQuLvUG582lwuLDsU=;
        b=SRhwF0fTZikqcBgODJGdx66wqI+DlV47EOT8gFydGRLTqnLF/tybLfy5CH77pA6CYl
         mDY2uYBx3OHmQuU/5QlchcwdoKqh6tJAev8hPeQ4pXief34oyHGVXkIkQ+t+vFB6wY2i
         ABHM8uZ/Ihnusi50mGWi/n2RAz1N0ESesMXSacP6qz+WMhwv3xQ9R9hTrFt7jQefDRkY
         wq7vTUSqV+Qt6UPV1+csdU4gBM+NyA8YKa3Sis7MQ/kmFBdhZ+iyQw8DhO2M5T1P/Jxg
         D7Mvq28xHEy3pc+U7//yfT9mtxEXqxFdnfuvfGr453MdsSQpPObLmQOyRndd7dS7pLam
         Ku7Q==
X-Gm-Message-State: ANoB5plVqQMq7acxRhNpRGRXky1HR4XZPT0Z9P7PME5VcEAU4MO/7bil
	j35SkJcrW7HStKa2PnigxW1AhoetdAqAvSpbYhBp+A==
X-Google-Smtp-Source: AA0mqf75SduNvhVQKDFmQuCeAd5sRLnb4nLRDUoaE1P/ORcJuPDqFvjop2ZWxhYR92NufjgI1Gwz6IZA4WKX4793LGs=
X-Received: by 2002:a81:7909:0:b0:36f:d2d9:cdc4 with SMTP id
 u9-20020a817909000000b0036fd2d9cdc4mr5218311ywc.380.1669106089855; Tue, 22
 Nov 2022 00:34:49 -0800 (PST)
MIME-Version: 1.0
References: <20221122-mtk-pinctrl-v1-0-bedf5655a3d2@chromium.org> <20221122-mtk-pinctrl-v1-1-bedf5655a3d2@chromium.org>
In-Reply-To: <20221122-mtk-pinctrl-v1-1-bedf5655a3d2@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Nov 2022 09:34:38 +0100
Message-ID: <CACRpkdZUjcO3hDwibCL1qTiSiLPQVYo5FaH3rzxygUBBwVHTwg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: meditatek: Startup with the IRQs disabled
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ross Zwisler <zwisler@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, 
	"Joel Fernandes (Google)" <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_003451_788692_693D0D8B 
X-CRM114-Status: UNSURE (   9.77  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 22, 2022 at 12:39 AM Ricardo Ribalda <ribalda@chromium.org> wrote:

> If the system is restarted via kexec(), the peripherals do not start
> with a known state.
>
> If the previous system had enabled an IRQs we will receive unexected
> IRQs that can lock the system.
(...)

This is obviously the right thing to do, so I just applied this
patch for fixes. Any ACKs and reviewed-by can be added
while this is tested in linux-next.

Yours,
Linus Walleij

