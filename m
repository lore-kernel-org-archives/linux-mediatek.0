Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17B9C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 08:07:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D4EA2070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 08:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CuQ4orqj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pO0yYGQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D4EA2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WqozDR4tftORPYum0r2C4zi7oCOS4HWIe90+Yzbz1BM=; b=CuQ4orqjuxPnDpzCJs8k/XXQr
	3guZOKCSx244PRB+4BxiCd05iSMzAjoYgP/xLUgoEtvv4/sdsvn2an0S8Bkk2fbUPMol1TaESca11
	nBomFEumJW1lrzMzDyC/NhlC+PZ1zUse/88W7NRx3kRILpW4mM12efg9eDy2IU+Y8v3/j8gOAPUZK
	1OVnWFkZS8AmjsPYHulgdvPAT4M7EdP/V0Uc0bI+25eHC9xYrI4btmTt2WqwuxXD+0wR8jY1cESoJ
	qGBRN/5d5foQAk4iQNDRlpHi1SAqK5OLwinZzxs2H9G/yky/v8Ap6NTvkNQ48dahOfN1llDDkGFY7
	Mpm66ganQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzyAV-00010K-9R; Mon, 27 Jul 2020 08:07:31 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzyAT-0000zm-DG; Mon, 27 Jul 2020 08:07:30 +0000
Received: by mail-lj1-x244.google.com with SMTP id v4so6513669ljd.0;
 Mon, 27 Jul 2020 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QBY+w6jlyOsmPmSWdAT4jKigsszPSmssReg15Ky49UU=;
 b=pO0yYGQCSTQKbT0MGpMhARYtQU/QS+0eHydoie2QLOig4M7Wwlc33+Ywk7W9mH1iMQ
 oAUuHrynvVNvmmbF+k8N5B0j8+maV4Wn+MMIuXuxcXmBYtPtBwGDK7X6++E5EebQkd8O
 g9DZWNBmfNbewt0xugznCCNnRCuL2u3UVzBv/R4Zu4SAiPnHNvI13/XNX7oUcF3Kzs0f
 490YLr4rsAyv5QkH2FySa8u1/4vZugEYa8xG3LFW+GpfG1zFg9SetYLUes9Sfe9Xukli
 pv8+nz6+btJpWeL5P/pnh68uiC7AYJCSCCFKuJtwxeAsOidqiGxeU9vW7SSq010YLTk2
 GbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QBY+w6jlyOsmPmSWdAT4jKigsszPSmssReg15Ky49UU=;
 b=UvYmf8qw9/QRpqrx2L+JS3Ub7xRQkhP6VOGIb3ok0yZUW+lwqFEiAE3zjV2X46NW9S
 j3x2Cm8xK9kfTZHcJX+6/G6synS2LeVOqS2isKkvbC9qKasF4wU3U+GDWcwX2g94Sn+u
 xCn3JDfkbTl6Re70IWqepxSxONm9wjqrpAvwqaTtxUVHgEv5GCWhHCpXJjmlMdNdAQzw
 kiHl3dNwV9Mp64eXoxfu2SAIxOvpYnabdIWYXVfkFZCeJ90n0OIcJGya3cCm+xGOCog9
 a1txAEXXxD7+YBxn92PelZEFO7KwPbw8kN3Y6rpzqY8KHDfZQaKSyCd1wRM9ZYpRR3nu
 az2g==
X-Gm-Message-State: AOAM5330u4eRSnu5Hf12/D983Uh/pet432UDX8c/OZmOTXY+2nnQdatT
 8k9P8C42oj7YuNMc7ZqwSF8=
X-Google-Smtp-Source: ABdhPJyp2w8n0TkWqz8Tn1BMhL1Hbci2VJ8g3DYVzcr02L4rjMmleq2Q8xI7QTOB2HipNAT8vnpsPA==
X-Received: by 2002:a2e:91ca:: with SMTP id u10mr8963831ljg.132.1595837246293; 
 Mon, 27 Jul 2020 01:07:26 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:2f5:268:51f1:5041:2d6d:a8b7?
 ([2a00:1fa0:2f5:268:51f1:5041:2d6d:a8b7])
 by smtp.gmail.com with ESMTPSA id t205sm2861608lff.8.2020.07.27.01.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 01:07:25 -0700 (PDT)
Subject: Re: [PATCH 10/11] usb: mtu3: clear dual mode of u3port when disable
 device
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi
 <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
 <1595834101-13094-10-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <e30483ff-e66a-1cba-e166-a1fe590c2f03@gmail.com>
Date: Mon, 27 Jul 2020 11:07:24 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595834101-13094-10-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_040729_464033_92CA3872 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
Cc: Eddie Hung <eddie.hung@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

On 27.07.2020 10:14, Chunfeng Yun wrote:

> If not clear u3port's dual mode when disable device, the IP

    If we don't clear ... when disabling ...?

> will fail to enter sleep mode when suspend.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
