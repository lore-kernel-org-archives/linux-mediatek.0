Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4692CE7D1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 13:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKE66rwTZcuv1+y6g8yFmgBe5osyLmX7xYBBBIqfHOM=; b=KTNmImq8Pe+TYmHTLNwsDmEVaA
	L1A0KW0lmuEgXKWPdFS3v+tBF8M9bpgNxq2gD0ixMsDWcKk0veLyGXujknRy/r8wSCicltomxsuoM
	egJi7E5PEIYqWnpkzpqmALCJHNoMcd9jlmurXNIkmyHqOKbkID1XklNeiiZjabfvqAiiLM/byJBB7
	owuFNBiFkoZSD3jXXLiDGOzS46qjkPZct+1qSCcsZDp2UIbK6jIZkjawkYHehzGUJR4baDAzvhG4I
	uYpPY732q38yV8xoB7O7NljP/RW7Cx7ZS9nsQbhcyLawDR3BGrGf+KH5PzpSbbe5IRCsbQed31rXr
	LfxKg8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcfU-00000002s54-3Db3;
	Tue, 01 Oct 2024 13:11:56 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcfS-00000002s4k-1cpj
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 13:11:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71971d2099cso4445204b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 06:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727788314; x=1728393114; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKE66rwTZcuv1+y6g8yFmgBe5osyLmX7xYBBBIqfHOM=;
        b=Qad70J7lCpirSmA14XuTG5aMN3TMokS65fd2V7l75mXbA+uzpSsmome4ZIhFEX5Xfj
         mWI1fYIVIE2etuUb8vaJDZ6NlD2hLDtf9dWP0d5R3cP76nMqYTOR1lWrZdoV4+LXuFX4
         LrB536Ij0HJ8LB3ujaYJq8JGNTfvz0w6q4U6lsXTnJGco/qoJTj6O7oaBz6/8ViybLzy
         ve2s4BXGi/Hb5KJ4VUTCVZwRfzbRZiCscT4Q6yFykzS0c34OBloFTuOzN3mcmF3rm1/8
         XoOYD2qrHWqHMW7k/NPopZN2j9cYeq0MyF02+VAQrOdLBlcenawV+PI7tMDYCDnAzsIz
         bUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788314; x=1728393114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKE66rwTZcuv1+y6g8yFmgBe5osyLmX7xYBBBIqfHOM=;
        b=fdVnXVBwuxIhXCdonQU+bmFfZYP8079pqSzb4H0LrJfhFAcnlI7MDFaYeiMCSLUEb8
         wtyjDzz/2EHtyj9PSiEf8+AL+Yj04ppxIbyAOJ6RKaB9gs88IwNILqH2rScjm4hZUc0J
         I9+JRU0o6y6ci++16M+WRaMwuYnX2Cr5P77hkBBvnMnWl1Oy1gy41F6JkDpjizjOGccn
         OSpPqZCrJCZtqfPx1XW93LA2zjJy1Vm0HPrYHIF9n4DqcGpv8oQSMgOj8MUsLrRevZqC
         AYwS49zJiD1QTUKuJMUaN+eyBZVw3xKPScO7vQNnOWYtFR0vbajhqNQ6MbKHIqMo0h0Z
         sk1g==
X-Forwarded-Encrypted: i=1; AJvYcCUJsiQ/zczXb9omrUe+T0xHXRZDs1f/UcSCD5GmMt0fQC8uub0vGIc+8Do7QT8ljuSancFsZbs/g27iB96YWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb9fjQpd6qBlMrB4CdIWkCPeadjnPLyF2GZEXZTBOTw+zWKTeR
	7rR4HN4pyPek2iajPoeT+2f2XoAKDCyvaIW0DlFNtBEIn/pzZZ5r
X-Google-Smtp-Source: AGHT+IEpmgHuI/o4uxbogaqExfPeG+jRXxqLV+M6Rqvfm5prXpZchS2HdVeaaITvEKfnDnlf4cEvGQ==
X-Received: by 2002:a05:6a00:3c8e:b0:717:8d52:643 with SMTP id d2e1a72fcca58-71b25f39a5amr23538643b3a.11.1727788313478;
        Tue, 01 Oct 2024 06:11:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b265181f9sm7946229b3a.133.2024.10.01.06.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:11:53 -0700 (PDT)
Date: Tue, 1 Oct 2024 06:11:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <Zvv1FuXBZpjDefb8@google.com>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
 <ZvvyEux8f2ylRQOn@google.com>
 <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_061154_446730_50C1159C 
X-CRM114-Status: GOOD (  15.90  )
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

On Tue, Oct 01, 2024 at 02:06:19PM +0100, Mark Brown wrote:
> On Tue, Oct 01, 2024 at 05:58:58AM -0700, Dmitry Torokhov wrote:
> > On Tue, Oct 01, 2024 at 12:07:16PM +0100, Mark Brown wrote:
> 
> > > availalbe when a regulator is turned on?  There's also no difference
> > > between DT and ACPI systems here, both could have the regulator fixed on
> > > and I'd certainly not want to rely on an ACPI system implementing a
> > > device specific delay after power on given the sort of stuff they like
> > > to put into machine specific drivers.
> 
> > Well with Elan in native mode ACPI FW does do proper power sequencing,
> > that is why this commit mentions failures observed on Mediatek devices.
> 
> Yeah, but that's got to get washed through the individual system
> firmwares to get deployed and my confidence in vendors is not high.

I think native Elan is only used in Chromebooks where firmware is
decent, the rest are I2C-HID.

Thanks.

-- 
Dmitry

