Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BECC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 17:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAnPRfekg/o84gnkOYmqiOyIH2LGmW4gkBg9r3/KYEk=; b=rDPIARp1nQgOYJ
	E5paev+kjjHu69fuhbOwQHt6swAeZcsJVfnOpmGPczk8ooAwKqfZe+Er/9ZldwLMaSNxX0ZGre2LG
	zXEutT+lm872BdufmAHkY/boApNpDO1TGsy9k/kN4zGRe2NiEwN55smgEpFHSkWjiBvkelxAT0+dk
	YYETNtqoamp03v3Q5E9vvTdiRcwqBvkfTxNOazOH2MlBK8MJ3NXZ4hkPH0e93Qb3mEc4vWcIRj/J3
	FscyBN2CbC1WcYLf22wuJKWcREklCpVbGoC/TLS8Wmd/kvFYtAoatFAJBxDAgpNbYHAKltv4W83yr
	p/fB1cywkaLSsgvAbXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VqZ-00Fvk8-MV; Mon, 17 Jan 2022 17:31:11 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VmE-00Ftdf-Pr
 for linux-mediatek@lists.infradead.org; Mon, 17 Jan 2022 17:26:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id q25so5032844pfl.8
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 09:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9xoC5BsgBs/Mu4qr+hvIn82GqzQBroS+8rFaa/f2Y/Q=;
 b=dAYvjWk1j+16Hngzm2LLt+t7e+CbrlYiMl4l4BmVmHKl2cbhj0iER34yXKF/X3bwGW
 Qr5VUfV5ZxX0PyqVwyZSLOJuU82BuGOipjVoVD2fdcluplrY9NGJ8XkBHiqsNueKrjI4
 WVvWljGrn7QsFeKYApaJw4uO0IajmBOQ1EsdVjXaiA81MRnTAnyBgG8B/t0G6W2FMr+U
 uu22lpYcvFc0WzKKSciststJXXRh+sDHBDOpcZfFncQzOx50NzGsWMCujhd2pvtTmemW
 4A98ORWnlHXEzY+6l+1Ss9H48dp9XalcXo28uTEC8KE/mHx78E+PGoZVlfV7YsXZzq46
 j/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9xoC5BsgBs/Mu4qr+hvIn82GqzQBroS+8rFaa/f2Y/Q=;
 b=YGNb6Eir1afxhoM+rTqWDf5oNFqSRoFbJBps832sO3vYDebxKHLOaBTHariM523+uX
 oVzvLXLTEpZAbmucurqhcBIrm4iWiSJK7mmutuKRbCN8lskuLttbkTZkllndyTP4DJx8
 2vyHr6/xkxYCLxzmrj87eL1kkICL/KSq9xjQ9VabuGFehi1oO5LSv2O24yJmkzBkQpuk
 bm/KNjyyukZJIFjBF0hj+M/tKYPY1ygpPO6jBjVbH2ujnUjPvWbhuihm2enLXfEOLBlt
 Om2Gc5Xu38bnYFy8MTtPGTkE8AtT2sokiMgpNNw2fc4OLP7Y1fGgY123AEFFv5eo1ClP
 HjTg==
X-Gm-Message-State: AOAM531AdmC3zP3CVnxuBKu+i6rs4CEXdPQw32vpseGX/tps14keXW6+
 3TXM1SEV5z+zPQiMA9Ldt9Bs4A==
X-Google-Smtp-Source: ABdhPJwVHQsaIzkL9JzjnuMFHxnugQ0rALeKq6btNIsXwiYFKnL0G1gx7VsQK7B3fGJ4eP7Cw23AjA==
X-Received: by 2002:a63:7e14:: with SMTP id z20mr19653366pgc.194.1642440400571; 
 Mon, 17 Jan 2022 09:26:40 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id l18sm14832167pfu.63.2022.01.17.09.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 09:26:39 -0800 (PST)
Date: Mon, 17 Jan 2022 10:26:37 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add SCP support for mt8186
Message-ID: <20220117172637.GB1119324@p14s>
References: <20220105094125.6917-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105094125.6917-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_092642_868719_7627F6F7 
X-CRM114-Status: GOOD (  13.48  )
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

On Wed, Jan 05, 2022 at 05:41:23PM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> changes since v3:
>  - use rproc-next
> 
> changes since v2:
>  - remove redundant SoB
> 
> changes since v1:
>  - use mt8192_power_on_sram() helper
>  - add MT8186_SCP_L1_SRAM_PD_P1 in mtk_common.h
>  - add MT8186_SCP_L1_SRAM_PD_P2 in mtk_common.h
> 
> Based on rproc-next
> 
> Allen-KH Cheng (2):
>   dt-bindings: remoteproc: mediatek: Add binding for mt8186 scp
>   remoteproc: mediatek: Support mt8186 scp
> 
>  .../bindings/remoteproc/mtk,scp.yaml          |  1 +
>  drivers/remoteproc/mtk_common.h               |  3 ++
>  drivers/remoteproc/mtk_scp.c                  | 35 +++++++++++++++++++
>  3 files changed, 39 insertions(+)

Both patches in this set are giving me a checkpatch warning that is impossible
to miss.  I deleting this patchset from my queue.   

> 
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
