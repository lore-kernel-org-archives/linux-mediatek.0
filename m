Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E27BC2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:37:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C64882395C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R3kVGSZL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPZFEYz7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C64882395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+J5GESOXssSIwx6cl4VFYgjr+uRFzVSNiFZsKkNRVO0=; b=R3kVGSZLvcHKYrckPeMcT3eSY
	ZTVXgd4FDaRwSGno2iwefNEemPoYfV1EGSyqkkORoBr2O9KMI1hFAw4B3qfoKumz8Yri3DuHyCjXO
	Y4WHM+Ql9GSTNKpQBNugWuEiZoOomY5Gxoz1ZccomaVvCTv6iF3uJwf2vpDIlcJPpoUONt/MXBvTi
	eFOHQ1zHvDS+Pr9SdxNJDEwQnX9Txcpc8D1xbJXgDrHjuAV5gXuhQ66Nj68Qn10qbcEqEaZXVzGh0
	M5V315j8BM61jV1HOt/Imvb9dUMQowqCWhhDY/AfzMheMFGIVTOQc65YTxl+Nz9V5aqgPzGuj9RHf
	mH5Rql9yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKhXs-0006rW-3v; Tue, 22 Sep 2020 12:37:20 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKhXn-0006qY-TF; Tue, 22 Sep 2020 12:37:16 +0000
Received: by mail-io1-xd42.google.com with SMTP id z25so19295310iol.10;
 Tue, 22 Sep 2020 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zFQzsuujKElV6LtzLXsM0uz/7sKSzxEF2swvXixbgcU=;
 b=pPZFEYz772Y00aL6I89bLezhZ1ZSA+934tPUMBBiooGMWH19SXpJ8bl10e06NmMYWr
 BuK/9pGS4qwZFIdpuGZmydXZxaxWXKBvslrO1C9ZY4VgVmNmTnqpbL7iFlf4sjR1Vo3r
 sI2xwGwV/jaAtOXb49k9udGvyJ/bbFRTDOGx6K7Xekik/1B43qONcRllYBUW8jMLSMdj
 ID2fqpZQwgvAnMkm9GNjMg0OP/4/FEMMaX8OQeXdD0wCmcMlTx+VP5UgVq7HcOfLVF9P
 TI7cwfDv+ekZ333Lu9auSteTza9zPTrN1UpsXjROHSAwv8yhy5P4YPG6ZypqSDzKUedh
 Y5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zFQzsuujKElV6LtzLXsM0uz/7sKSzxEF2swvXixbgcU=;
 b=IM4yRubw6Su9IXyhwDcDeYSJeGZPKgDMCDK9xtRyH10hQuDzJeV0QelgmUYBz0hLd1
 puJ6G4cnf31gFNZ3rGggeEd0veaB084SyFfiLiDO50xBcdIEnG6NIOzf9ET7Uw/7LXej
 B2ygeL0D4IVvUAxg4ToF5B+7UrqKmOAFETVP8qQsPWaAPqF+N9TMdWMb185Ffg2ZCOHR
 Nsi9PaDf61SIDD9hfkjpbRro3pYhNJuwYO3ra9ocCtOfRFDA/yCzjA366isDf2hHjo/Y
 YcoUH+vnzL9P1HWqHTGoWVHHe5e5TOuu+nhelzGftD0yREEitFeg9v0j/tY7UljdpiSI
 oGTw==
X-Gm-Message-State: AOAM532F6Vo8Q6C3zq29ConrGq4FMR12aLU9OlPQwazfkEVAOXJpXwK/
 osPBBMypRMqTo/gLpydD/pAMWy1E84Panr3svOc=
X-Google-Smtp-Source: ABdhPJxye/MkIp551boOR1WwfOkduVFP0l+ez27MYGdisf+spj9/XVdhXZ8I4q+9AKlggFGWhalMz+fJ3lALpCJVGkg=
X-Received: by 2002:a05:6638:587:: with SMTP id
 a7mr3788125jar.72.1600778233885; 
 Tue, 22 Sep 2020 05:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200922114905.2942859-1-gch981213@gmail.com>
 <20200922120112.GS4792@sirena.org.uk>
In-Reply-To: <20200922120112.GS4792@sirena.org.uk>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 22 Sep 2020 20:37:02 +0800
Message-ID: <CAJsYDVLsBm9pnjd5hbDptXXN3Vd7e=cpuDMc-d-XZ-k46j9ztQ@mail.gmail.com>
Subject: Re: [PATCH v2] spi: spi-mtk-nor: fix timeout calculation overflow
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_083715_969383_1693CC36 
X-CRM114-Status: UNSURE (   9.28  )
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
Cc: open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 linux-spi@vger.kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?QmF5aSBDaGVuZyAo56iL5YWr5oSPKQ==?= <bayi.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2020 at 8:02 PM Mark Brown <broonie@kernel.org> wrote:
> (which we should pay attention to in the core for flash
> stuff but IIRC we didn't do that yet).

BTW we do have that taken care. spi_mem_adjust_op_size will
adjust the transfer size according to max_transfer/message_size
if no custom adjust_op_size hook is defined in the driver. If a custom
adjust_op_size is defined, the driver adjusts the transfer size for it's
exec_op hook. The size limit between exec_op and transfer_one_message
can be different. (this spi-mtk-nor is an example of that.)
-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
