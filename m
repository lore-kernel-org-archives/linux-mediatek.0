Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31280E71D3F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZgZNblR8SfW/4R6oKkon9JEl6qDNJGO3vXwUsdRVac=; b=ZysAAtET4C+tE+mHgYdyXMSsIP
	+al+LvNqjj7LCaFlJ4ybvax/FNOmViFATiFoZW3NL2jkrgxGakYRLXQs+gh48xOH+99QQSedETiGG
	CGA3/91Z1gngbjkw9ogULMA8x+GahEiMru4RDpXGhVacKODZIE7ocWvZ5xeep3ERBTNdfya8ehlaa
	pNc9NeN3gXIsrCKULqUz5XX87khhX6F398Je7xT7EZoBwgZM0udi+d0hs6MYLoyVXYgeq2sFVpIZz
	dzZcm+zDu/xuyDznZpeZW4OYAlL2DbZerpbRtZU/n3xVU/Zqjs6SWdrBSSbEJcPfyYtgA2HdCIYDr
	Qu/f9ZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmEGh-0082Kk-2z;
	Fri, 29 Sep 2023 14:14:59 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmEGd-0082Ix-0C
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Sep 2023 14:14:58 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c1807f3400so9077741fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Sep 2023 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695996890; x=1696601690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZgZNblR8SfW/4R6oKkon9JEl6qDNJGO3vXwUsdRVac=;
        b=GJ4NKZ1MpUId8MOjbxaXPNu1fFx7cpymlWw8mFlFxNxnNkuGUArh8Gd7SV44Do5SHk
         Ymz1uR/9/zDmzXzqyCxZob/KkVwqQWAQhnkVhf2ThEu2A7nVm8Sh8q49iXIlJBSRNM1l
         ebwUfu6ryO985/B6ptNBgjI/NGRJUkuq7Xff8Xood3W7km6VS/LJm5MTAeww13YwmuYN
         pcjacpOdJ9s+/tHIL4pM2ZLXTFU3O+6Rl1pkbfJuZZ3xYD/Uoa0Vrs6WaC2a1kyBdN4s
         UdAm4L6C3MsXJ2fMeVwIyqPcaS8se0uY7/Jrdv26G0YrLlKikgLCDdDUArcC+CmvPO7A
         37VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695996890; x=1696601690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZgZNblR8SfW/4R6oKkon9JEl6qDNJGO3vXwUsdRVac=;
        b=exDUbeGmAdin5XNMlYgALMbBmQ9JUxDupXVgFC1/egUB15tZfIE9wK2rWDH/qqTPQK
         HlW8p4M+JUI5arOuoElEGZ5J98JIiQeDDoXThaDzQo+EVtM20FR9x/nGnQYmAWSErqhm
         XdSLSsjFTvB5xJivPT42m4v+aLx7PJgm0aYvFsjNtf8O1bw9G2KeIPdCLw5yDXNizW8v
         YfkwYuasPiVhsgBmZh3ktOizLqmP6Qpz/qSRtfM2DMWTNVFArsIHPpTIpaWB+fkNCuoY
         L03lFnkAE+1Tf1CFAkNapVjSnI/EzmMD6PVnNMaTHMR5xaa/uehB7jN2LpG6Lk2mPd0n
         XFHA==
X-Gm-Message-State: AOJu0YxWJJPap0Y0lk9BmGgZHQtn6Ecso0LKBXQJPNaTpqyCdfdJrnDb
	55ZLlq+JC+7Mpuz65ejVqbFN3Qtqmdv1Pa8kQQ==
X-Google-Smtp-Source: AGHT+IFEO1axz8htxJf7NY8ey6tqW/VBV1n2cJtYGQXzDfYk81LF0OT2GNAX4KPv9SIeFxDYtngf5+bJLsUGJUE0yJk=
X-Received: by 2002:a2e:b4b9:0:b0:2c0:b37:a1cf with SMTP id
 q25-20020a2eb4b9000000b002c00b37a1cfmr3443644ljm.22.1695996890212; Fri, 29
 Sep 2023 07:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230927033557.13801-1-peter.wang@mediatek.com>
In-Reply-To: <20230927033557.13801-1-peter.wang@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Fri, 29 Sep 2023 22:14:38 +0800
Message-ID: <CAGaU9a_0Xu8X4ouRbygquEXhLWb_4KvKQAnUF+XTWVE0MdhpJA@mail.gmail.com>
Subject: Re: [PATCH v5] ufs: core: wlun send SSU timeout recovery
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, 
	naomi.chu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_071455_098036_BE19192B 
X-CRM114-Status: UNSURE (   8.16  )
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

On Wed, Sep 27, 2023 at 1:43=E2=80=AFPM <peter.wang@mediatek.com> wrote:
>
> From: Peter Wang <peter.wang@mediatek.com>
>
> When runtime pm send SSU times out, the SCSI core invokes
> eh_host_reset_handler, which hooks function ufshcd_eh_host_reset_handler
> schedule eh_work and stuck at wait flush_work(&hba->eh_work).
> However, ufshcd_err_handler hangs in wait rpm resume.
> Do link recovery only in this case.
> Below is IO hang stack dump in kernel-6.1

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

