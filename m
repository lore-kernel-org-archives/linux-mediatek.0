Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E20CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RR9FaDPqkpeKGuLaEOXh8qZrZXR4cDD1UdEUmaCQWaQ=; b=kE9lwlsrOvJozh
	KViqXh0DKTTHarUZ+x9guQrEEZr/7bAcATT4SjEpnIQe8mQv7tzI7apssEbrbW/nrczVOY0qvyqiA
	Nk4hiMQq5bpT7G4NNTJH+nVqIIaHTXrZpPTN6JZKDJUx9kbZNCgFjbWSJ6CkaC3nqpIboP7k5GMmT
	D9Zzb/IaotHPHUca/gBU/PJdSfO7C7pPLQ7KVXmgcPEIkr6V/MahyS3Qys6C0HM0ivWanawqYMe3S
	mDwJhbcBdqVyYzicDzsEh0EU5F/QPj9EfYLuNNsgGf8aiqQMMHJP7lSmnDK1ZreWZDf5hwjymA1Wo
	+VzioUKjTDmaZb7+cZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncvqU-001G6o-Ic; Fri, 08 Apr 2022 21:08:42 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncvqQ-001G5v-LB
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 21:08:40 +0000
Received: by mail-pg1-x534.google.com with SMTP id s21so4263184pgv.13
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HoLWT/EythxVH1YT+vEjLN2TXDPwfF5xPPqMajsg97o=;
 b=6DqRW4gK+PKLqJfJdAd0TGTO95Ya7KDB3mBZJjKMlL0nxZLtgxfpl+75BDL9PpUtD/
 D8sxCCmecY9A1jNHsGn59jfaYAYVcw0MXiJZsMdhW9Hgaj2eegEWYZqhsHZZ8RViFFh8
 g/mUJ5pRz/mDzFZbqiAMFiy2sA1QwSdm7uJ+N0EWGsnS9ZjEVfmjTnqFmuhMnW10Edv7
 uODRBJwh1af7cUiTZDMOJnhCYENwjfab4lz7/KYYJOcswfmpJxqrQ5/bp0tB9mIV7ZMt
 Kceie9MXCbkN4vkioRj3xK49n2u3J7v+iyzNlDM+Hsx6W8Dz7u6YcGhollnP1Te9u94x
 iUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HoLWT/EythxVH1YT+vEjLN2TXDPwfF5xPPqMajsg97o=;
 b=UiONVccpPDZD+44GcxExIRV3wORVgq+AXBb2HsGszRsvTvD6GBXd42qKS8oQmsyD9l
 9QmjgXkXUJJJP1AcIES5mTo0Nds2O9OmxECMKrowgNXjggpx1udv6AzRJtMYXexk7ZLE
 j7ttjSspBAnyyrSp5JeY/6wZFULa+koJW0x2OzkRcQ08PxGM2ypAEyxM+7uNgGRbnWuR
 lGDIFcdzRmrwY+psRftab5RVoq3710f42n6QsDZdNaoYtO/LAiO/4I6bu8DIL64VPTAR
 4EurmdcrJIIZzzpU8xNw0ImM+9lvt5x+dVZmyrs6+Cu/mqOyV8U8fwpQggHPIW7R2A6Q
 VG+A==
X-Gm-Message-State: AOAM531MZcM/6DoYdP0SD4ySMcPFOHV1ndUBmZcHz31ysX/dUB5UFwEo
 J3oQJ/avlJ4z7xoJe2q49ThlmQ==
X-Google-Smtp-Source: ABdhPJyvhkTmr6m8xOSTjNCBilnTlNxx+TZTy+ro007JGG5u+GpijdOFdlxjLZjwIoz7WZTYTZhnOg==
X-Received: by 2002:a63:c015:0:b0:385:fe06:eb86 with SMTP id
 h21-20020a63c015000000b00385fe06eb86mr16908387pgg.132.1649452117075; 
 Fri, 08 Apr 2022 14:08:37 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 s10-20020a63924a000000b00399571b2f99sm12120792pgn.57.2022.04.08.14.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:08:36 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 11/15] cpufreq: mediatek: Update logic of
 voltage_tracking()
In-Reply-To: <20220408045908.21671-12-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-12-rex-bc.chen@mediatek.com>
Date: Fri, 08 Apr 2022 14:08:36 -0700
Message-ID: <7hczhr5lm3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_140838_727971_6758C117 
X-CRM114-Status: UNSURE (   7.31  )
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

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
>
> - Remove VOLT_TOL because CCI may share the same sram and vproc
>   regulators with CPU. Therefore, set the max voltage in
>   regulator_set_voltage() to the proc{sram}_max_volt.

This could you a bit more detailed explanation.  Why does VOLT_TOL get
in the way when regulators are shared between CPU & CCI?

> - Move comparison of new and old voltages to
>   mtk_cpufreq_voltage_tracking().

Why?  And how is this related to the above change?  Seems to me that it
belongs in a separate patch.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
