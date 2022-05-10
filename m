Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 09:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QT43IM0t+UhSqyD1MDPCkr6T6DlzR899X+8nMJumAbQ=; b=xFMsIrFDRdAP7Y
	dCoQsN/RO0aZ0S7O6LXMDDy7ZlCYFR5y633nKjzRJD6E0C4uPrPWXQDiZN58vUV5beTKkj2W6MxRu
	Pm65TzvDzL3zPveCgtPiuJy68JKb/Mvi1TDPbarizkas8edSAPLN3ESO1AlpnH28g9Cw6WNtBvWW9
	gqMORUOHrJMatFAk6cO7SKeql64l3D5QL5CY4oCyBgg10u1/w1BqoUTTcNtg2Li/gSrXpIYWanKlU
	Jw6+uiqScthQHgOm3d/7d5tymxBHaN6f3jvfXaerRsCXXoILpUVyecNMPqqvmXS/W9qOa1lkSBdaJ
	f2mqs/HkW5njC2NFkKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noLsY-000kdF-Vo; Tue, 10 May 2022 09:10:03 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noLsM-000kZW-Oh
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 09:09:52 +0000
Received: by mail-pf1-x435.google.com with SMTP id v11so14425500pff.6
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XSWbv+Ep/+Movyv6deaCjO1wiUE43cnYmOPnE+KhShY=;
 b=InV8ymO/0KYq9HcbHPDzUpNCNY2tYQsq9hirMYdloDuxo6cf1pmiZ4s95TKpKxDEcb
 aToeQIuxQ+lqIYo5EPxdXoEEB3gw4t/q9aLkS7CBbxXq72/nwbAlod397u/fG+q2k3YZ
 VUHOVvkCCPVxJ//otLXECEBR9BTzlaRbFzQN8RvONDRstQAA4sIbVdfp0WMhQ6J2zpVr
 CcDT95pgoPn6/34BaRT7OechnYzMknBbMd4YOPvHxtSo6vdjvmtIZe5KZHabrfiOJinA
 Ucbbds97FV5W7f5LnN9uG6/GwHbyN05B7rK0MXV5N9FEDIB7wweTlUJkkrKWRuCimOOF
 QZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XSWbv+Ep/+Movyv6deaCjO1wiUE43cnYmOPnE+KhShY=;
 b=ClBk41soPF4fmOmO6+fcqXtu+j713v0YYVN3v50Q2p+A3Zx2RXs2VOIq6pAwnJEm6C
 X5qUl70xP+pmKlY0P8H92tP7WYnojkqowy3hUbt1pwfC1kE6sJRkudaIz/oG6bIh/X5j
 mbOLdQCzUAzBJQJUhiUKP5U6Cs63AbvxTqKtqF0phjFXWZbt8avTmi6yJcHz1QkvOGnQ
 QnKvGSPAGzFDFIBuwOxM46ym1KJ880UWYb7sTph1CKWmvhFJfe9lr4BrL8IszAgEgQjl
 gVH4OIxNPqtUqW+F5iSGKQaJE1juJq5XWqd07sjgHS+aAQCW/5tceT0jgvWcH2NxJC/B
 6aQQ==
X-Gm-Message-State: AOAM532YOp4r8uMaREUN5JJPTuJjTjy6+q2H63Fr5hKRXxU/HsAhF7Ez
 p6+8f//gmjLRavoBkV191bsGJA==
X-Google-Smtp-Source: ABdhPJwXu+6bfJ2FOMd/hrpU0J6EJlp4sESW0BPiddeP9MlZQt9lZsG0xZQKTVaKRYINu2N3ZA+IGg==
X-Received: by 2002:a63:6989:0:b0:3c2:3c19:d661 with SMTP id
 e131-20020a636989000000b003c23c19d661mr16214262pgc.352.1652173787953; 
 Tue, 10 May 2022 02:09:47 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 c17-20020a63ef51000000b003c2f9540127sm9896907pgk.93.2022.05.10.02.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 02:09:47 -0700 (PDT)
Date: Tue, 10 May 2022 14:39:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jiabing Wan <wanjiabing@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
Message-ID: <20220510090945.qhqomdqemrtrqdyo@vireshk-i7>
References: <20220510080136.11950-1-wanjiabing@vivo.com>
 <20220510081232.4u25qgryszzqblho@vireshk-i7>
 <61a4b23f-9740-6fb4-abd0-640d3353e788@vivo.com>
 <20220510085050.tza6rjvdkjsrhrjv@vireshk-i7>
 <340a3029-1ab1-0e64-0c18-bb2464614919@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <340a3029-1ab1-0e64-0c18-bb2464614919@vivo.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_020950_887405_197ECE66 
X-CRM114-Status: UNSURE (   9.61  )
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

On 10-05-22, 16:58, Jiabing Wan wrote:
> Yes, I write this line by hand.
> There must be something wrong when copying the subject line.
> 
> Maybe I should find some tools in git to avoid it in the future.

Add this to ~/.gitconfig

[pretty]
	fixes = Fixes: %h (\"%s\")

And then just do:

$ git log --pretty=fixes c210063b40ac

It shall give you:

Fixes: c210063b40ac ("cpufreq: mediatek: Add opp notification support")
Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
Fixes: f126fbadce92 ("cpufreq: mediatek: Unregister platform device on exit")
Fixes: a3b8d1b12c6b ("cpufreq: mediatek: Fix NULL pointer dereference in mediatek-cpufreq")
Fixes: ffa7bdf7f344 ("cpufreq: mediatek: Make sram regulator optional")

and other patches as we did git log.

OR

Else you could do something like this to just see one commit:

$ git show -s  --pretty=oneline --pretty=fixes c210063b40ac

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
