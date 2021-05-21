Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B68C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C009461132
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C009461132
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6xpS/vHlqLibeQQLcUJayFNPGhLC4d5punKxqss5ak=; b=BSjZZr9bIP4FSGNXWs0+7A/vPg
	/B0riodTbTsAhQ5srBLYf7NfDD4BjP/Iu3DIxvmPb4A8J5JU77I/IJFiUKX2wLhvDIRK0fTuq4KXQ
	polBIsPYlXSS0xvUid/K2FoFk9KkaeEi/HUrLQIFvGXQMa+q+P1GeLrWGr1QQPNycZL0Uzh0Gnc5I
	i127yRCeqQ6Dqr+/wcFna6tvjnDRoD8IHtJqFduxQ/RQbNUqFlBzQsOcXfL5koLJ2pHS5nigbVAVi
	bO6bSnz9/UNOwL63q0kpfqNxtWg0P1hzYd2XzsBv8fMH6JUO1T1kcTcqMGujwMbX389R/xqZJv2x+
	Dzz/kPVA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5LN-005Yck-Vl; Fri, 21 May 2021 13:37:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5LM-005Ybe-Ig
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QTl2sSUU/s7VqJED6BBjvvTTnkniEWQTs02ROUyY35U=; b=CzW217sKnE/gwW+Xl2N/94vYmA
 luYCbTEp1Zz02Z49Z4PNRDdH1ZNIHaIMq5mV71eYu5TpYtQEbr3YWMmxprbPCdfM7FeDoTdmroVdK
 EdFub4638jGRRnhp9WoqzfZT9Aiao7FwEH4z5zzuQy0BOpGvOVr9xrkX2r16rZO2HIzMQcrC85/Sy
 nH59j5gaIWaLfAh/oJ31f2bpP5NrNPoTmf/72H0jlcSTk0O6pWUpPyJuZNmmIzofNGBDrN3PMxMFI
 zELiveIYqrVS4yVz1QfBSG9Juuoqk89Rt5VhaOxjRspC9sBD1cyflrB4qpsy4roFIxgTOz85OQenu
 SmHPKw7w==;
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5LJ-00H9Sf-Vz
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:37:35 +0000
Received: by mail-io1-xd2a.google.com with SMTP id a11so20180567ioo.0
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QTl2sSUU/s7VqJED6BBjvvTTnkniEWQTs02ROUyY35U=;
 b=BYahTz/2unNRZyj5oIDnvi41zYnBfRj4coQDpobKujlEc0wBN8as9PE6id1T2r+OqO
 wo2+h6DS9JZ7IVtET7EEOeegtmZg8t1Yuh/rlkvxZldK0mwLkcUm4wuwk72iDgsOXqk9
 GF9LHuhDFpj6idVeDTo90zSCNGKHnQqZyyKDHUf44aCSR7QLP+uSAgXR0acL9juPHiEj
 RuHzOHrgt56iIgbWmcn8s5CNaazEs8aR1+DQqm5/PdZTDV1OQ4piS8vSJbHdP7eZZjvy
 sX/Ov4UDny+2bXWvn0azbM2fGG9Ox/UXnMRXmqPTDSTmEAMVaVIW/BE3dR59DG39Ggwz
 rPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QTl2sSUU/s7VqJED6BBjvvTTnkniEWQTs02ROUyY35U=;
 b=ABWRHLDwSDuMQX+Ufad8/bxe3sILOI0TOv3Oev55nJAR2jsUiam59WcGAK3mifYE7d
 XShbzyXjhmofTrW5Wudm+p/146/BoKRKG7ccSY6txE671z1IzR2rdEk6Hh1aSmE/05Yq
 cqlf8caU3/UysZqkSzs277YCO89SN28JtqZdezC95TTKW60mqsIn5acvB8oZKAo67uoI
 wqFIagZseF67/jcXCe7ZCbqptmWIujIhAbdg3acbAOdTaAMklM28xfEeLt1RI6Cv41Fc
 jaNwLwEuiavriIJQFHqsMzvFceAjhv+0PmlDfeGmYCkcg0RebFq9cnkNPIrThmyiCqBk
 gQrg==
X-Gm-Message-State: AOAM532DGWAA//irHn80gyDr3mCkRh4OGEzossH6Sg0DC4kt2BYIxt2l
 ox+FcYAqOCAdlQ9ODO5Wrouqk0tQQPylop8O2qWn2Q==
X-Google-Smtp-Source: ABdhPJxteMqua21cI5k0SroJrGXwA1Ap+kuKB8k2NuAdu4F7fPSRrlrKGWsEOEctuuLB9dPBwaK0FXXFxOv9zkrQwy0=
X-Received: by 2002:a6b:e00a:: with SMTP id z10mr12609020iog.109.1621604252650; 
 Fri, 21 May 2021 06:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-6-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-6-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:37:21 +0800
Message-ID: <CA+Px+wUaA9o+Aom4weuTH4TDpCfFpxv0YHDArCJswEs6QmCw0A@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] media: mtk-vcodec: venc: support START and STOP
 commands
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063734_034122_6CAB106B 
X-CRM114-Status: UNSURE (   9.00  )
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

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> [hsinyi: fix double-free issue if flush buffer was not dequeued by the
> time streamoff is called]
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Per guideline[1]:
> Notably, the last Signed-off-by: must always be that of the developer submitting the patch.

In the case, should you provide another signed-off at the last line?

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
