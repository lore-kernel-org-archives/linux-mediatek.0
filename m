Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA14ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7e/OdfxuCaAZ0PkMO/IBgTbcYnXuhp/Qb+Zw1FFxSF8=; b=b9HpcKFEDlJPUsazqoUDHq7kl5
	gY4ItSOG4ONOJfKqwPDDrFSDtennKGbOGjag8i2LtbF8bB2vRI1anOSBJYLECDrm98+kY/3jQv6EZ
	4d9B5a1InxyROcDbVvvCszikQnQbxXRxXZkdH4bxnXOMNzXlMfysKa4fvvlBRn7VwPKoO10uUZKJx
	ZJHL8lS+bNtZXYt9nvRFV5nyUbF9jPHdYEtHS3i5w71O6ZEgFEW732D1EsMvZLUR5GwOn9/jU1zE2
	YV5uOt/BpDj8Jdurr0QQxckuSTyZoQJ5bEH2pA8UDgotmtFhrz3LOWHM94g8TyXCpoX4BOOw9MrBF
	3b6BYarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSdEU-008Kba-P1; Mon, 29 Aug 2022 11:47:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSdEQ-008KWf-C1
	for linux-mediatek@lists.infradead.org; Mon, 29 Aug 2022 11:47:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C30D2B80FA0
	for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 11:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AFFC433B5
	for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661773620;
	bh=qPR6kY8P1Myf4tVUWJRbQSNSevgMZAHBc2yHAWZJoq8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=g1Ww+wp7/IFs84CtqmpvQDmG41O2BPiahkelCnoSBvT0FiiHXTCHjuNsoUuNe6UV3
	 QLCdN8cHRDcnUCNCBGJEHefjn9dDMrmyRDZYhiJTDpi0bvjw0VkkUadDxDWweyYxJ6
	 TstMKViGGQlSskav5fLhZVfPGs+KkhjQ2dO0i4HjweNar56MaVL3WTW31oEVLHCUt6
	 7PCBHSOCx7FHZikqbVdYyN32Ex38lqAer1oWjNTNwkd8bM2hAQ/OcBJ37SoIACq5AY
	 KZFO7SbWN+hiTA6agWra5nQ/NavUeC1O64AAkLlEKnxQLjrodPPD/EW/jx1/rEVST1
	 GWhzrmkhN0ubA==
Received: by mail-io1-f50.google.com with SMTP id p187so6282715iod.8
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Aug 2022 04:47:00 -0700 (PDT)
X-Gm-Message-State: ACgBeo2/bjuZ/37uYDKE8dJpw01ehX0uV47DfzZ+px+w1/1bbBEYOZ6X
	nP6O/zkdvKsHwl+6qlaNmrfifjZDK2V96hCs/Do=
X-Google-Smtp-Source: AA6agR7ioo8S8kED0FExjat9wjWmmW52Zp1fettg/C47Vks8/xF+JiUUqJ4c4YkCLCDrio0Q6rCKXX3L1ih3kYYtQtc=
X-Received: by 2002:a05:6602:13c8:b0:68a:db5d:269d with SMTP id
 o8-20020a05660213c800b0068adb5d269dmr7903708iov.209.1661773619567; Mon, 29
 Aug 2022 04:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <bee56d689e67b4bb4d46d14d07e93ab212a6bb6b.camel@mediatek.com> <573792ba92de237d23a9a1c99cb45d5ccdff5067.camel@mediatek.com>
In-Reply-To: <573792ba92de237d23a9a1c99cb45d5ccdff5067.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 29 Aug 2022 07:46:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4rdvoAqaC2GpmR=bv7KmNXvP+58UW1hzN2KJDsNiRiPA@mail.gmail.com>
Message-ID: <CA+5PVA4rdvoAqaC2GpmR=bv7KmNXvP+58UW1hzN2KJDsNiRiPA@mail.gmail.com>
Subject: Re: [PULL linux-firmware] Clean up mediatek WHENCE licence terms
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	allen-kh.cheng@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_044707_954871_0311F22F 
X-CRM114-Status: GOOD (  18.56  )
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

On Mon, Aug 15, 2022 at 10:22 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Hi maintainers,
>
> This pull request cleans up the WHENCE for MediaTek firmwares.
>
> Please let me know if there are any problems.
>
> Best regards,
> TingHan
>
> ---
>
> The following changes since commit 8413c63c7a539a912be8851ce941eea32dcd1786:
>
>   Merge branch 'lenovo-thinkpad-x13s' of https://github.com/mrhpearson/linux-firmware (2022-08-15
> 09:02:17 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20220816

Pulled and pushed out.  Thanks!

josh

>
> for you to fetch changes up to a1c4b15986c07cdad873a72b1e130ea1fb02c5fa:
>
>   mediatek: reference the LICENCE file for MediaTek firmwares (2022-08-16 10:13:16 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (1):
>       mediatek: reference the LICENCE file for MediaTek firmwares
>
>  WHENCE | 42 ++++++------------------------------------
>  1 file changed, 6 insertions(+), 36 deletions(-)
>

