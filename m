Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A92BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9IS9FkoVtIWTrVvBK0mOhsj76oidMVqDPmZqhZdS1w=; b=N8oDAQ2EiipoWC
	LZfjPyoELzyLalRXfbaQqk0FRMK/N1Er5rx6VP9V7XE8raWtXXGjXi/tmVdCDs4/VAnVKVj0XcXtr
	MuG7oB2J99FJlYQtEiQrgV5q0jZsZer2Itng6qo7EdVTWP2MKLliHlfc5AD+a/Jw9iMeypo2LxpHf
	be2PYj5bonKBHFpiRCFJj0Q69pbL5Mj/upWDKSuUT329s27CQV/ufeaXagEOY4p6j05XoMtU4+rFm
	aL2Hc/cGnqW6/fIjNK3gOkT0gjDpOdjkqZiikxp7+K24JgIsjCEEFet7TUQONqffcTEuIlsswcXhC
	JXUJO56pi1s6CnbwU+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncvsi-001GYH-Kw; Fri, 08 Apr 2022 21:11:00 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncvsX-001GV6-WA
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 21:10:51 +0000
Received: by mail-pf1-x42b.google.com with SMTP id s2so9452482pfh.6
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 14:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=NGL7uIJYy64vRyv+WyTds0iR2sbu1H6xVYp+rBwYsq0=;
 b=0goe0SNyqeqNy9wKzBOTFC+7DmniXqC3vl6B6Ja5dbVTVTC/BZKzxTot9QUgRHj3YF
 TX9uws+8EDjls/VkPD49zygJEFl3fLPDh7wOGrUaQQ8Yi9manuILnBLXpKiJbDtK6wkd
 GBiXXLaiaTeyvR6B0bEboiCWp+bmK6fpIW/N2D87y5kKLuBdCDygGdepx6sOGFnlnlPU
 f25f1FkaVYI5MTYGDfi/LHNLH7gGp3EbDDCmm+zhZ3uyTsz7D43liONM+N5RJmkiJYTt
 63QBbMSvZi3/thOx0tR9I1AIZtqdN8wPSiaDxF/GgO4azda9Ys9eZDXwB5bc14UwGZJd
 PrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=NGL7uIJYy64vRyv+WyTds0iR2sbu1H6xVYp+rBwYsq0=;
 b=F0N2YtZZs2ATcQ12MeeL3B8QpxCrRpyW3LDIFEKFmq7eSHEtZRCFD0MyMuFMxfYFNW
 iBC+/aWYwEe5TYqYgdNXeqGpvu9YIBdYd+Ss1HqYZIi9fJ6nTqEqYjJJS6eNCVKuEa4L
 6l2wDa2l1aoUCDk8VtSKe4+doFUgW0jAkkFrRSLcYmImgGnjLksjEW8rfTiPDPPXOWsN
 UMNa4k2v7ayW8o+tuJOfA7GSpXeNdStN1jfaEieezka1Gl8/2DD/p12Wa+Qw0gz0DYvT
 JiZbK/TqIJ+ddvxP54u05MLF8DM/I42INd/JbaM+CO3MJgogWqpeJ4dGlUMiTKELoVXY
 rAew==
X-Gm-Message-State: AOAM531sN9jBOftyDp7ZIJNP+Jd1IDEpi4RdaFUpHAcDpjWDzG+L7UK/
 sEWfP7xZk7mKaWzWwPDWDMkJlQ==
X-Google-Smtp-Source: ABdhPJw5mutMPEroFwzVQlx6BF6zMMQsdO7eg6KiAaxV8KEQBMyUxgjwuUVnLSqBovjUXQR6fpGbkw==
X-Received: by 2002:a63:4f0d:0:b0:399:5115:ff48 with SMTP id
 d13-20020a634f0d000000b003995115ff48mr17296204pgb.235.1649452247397; 
 Fri, 08 Apr 2022 14:10:47 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a00c400b001cb4f242c92sm2330393pjd.26.2022.04.08.14.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 14:10:47 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH V2 14/15] cpufreq: mediatek: Add support for MT8186
In-Reply-To: <20220408045908.21671-15-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-15-rex-bc.chen@mediatek.com>
Date: Fri, 08 Apr 2022 14:10:46 -0700
Message-ID: <7h8rsf5lih.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_141050_060573_2C2417A3 
X-CRM114-Status: UNSURE (   7.21  )
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
> The platform data of MT8186 is different from previous MediaTek SoCs,
> so we add a new compatible and platform data for it.
>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

There's no upstream DT for MT8186, so I"m curious how this was
tested/valiated with upstream?

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
