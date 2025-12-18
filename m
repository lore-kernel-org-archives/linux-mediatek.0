Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ABBD68BDD
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Dec 2025 07:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7S7hlyro8bVLPaUshenPuh/zyDvp4ao0uVsdHOsDEM=; b=Hn+8GuxCDnIDCf4eNNberJo8B4
	YpUEqRue87MzYRNjZOxEMaItD6fqmIlW9/qNgesZDgSeDxSeVSWXvB5PSUGzVnv/3FJtuUAXt0OGj
	0z4HSNJYg/ZKukC2SLtdeTTKwtI4zYI1JNQtha0heaCo/aQ67AK+3vIl4VIROM8qok6IodBAO39X4
	fQgxDr1E9D0VQPpJ5b0TjmGaUhOoaAjFoBa+6y5gPQVlQyRxIwAhPd6tWSa3f8JtrTulUJeTtpuvj
	aWyKajB22+TyCQqmySrIp5bqgzwBp4p4uRikUYAbSpn+YI4gXxFFEzAOm4IttRd6S2CTiTEqUNDVZ
	0yeqjaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW855-00000007wAw-1PUO;
	Thu, 18 Dec 2025 07:05:47 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW852-00000007w9x-2bpj
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Dec 2025 07:05:46 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8173E3F68F
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Dec 2025 07:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1766041540;
	bh=c7S7hlyro8bVLPaUshenPuh/zyDvp4ao0uVsdHOsDEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=b+x9aYVE8DWnw9M4Xk3LXKWB4AxNPbR4yPGAV5qT9mRLujSAn3+jZ4wVLWVm25SyV
	 zVwQCKSOEBwj5Qa44loAOzLUdwYO69ROndaTk50ieXfnAlMTGGi5kklGjblg69VhrU
	 92rjjPVpcmdXo0LAHqm4uDDpgajFtDY/LM0yu4yK/LDO2EXB4x5OOwk4vq5kwLx61M
	 nSI+n/xifQ4oQGbvsNuG/1UmplXwed+yBouWNE87quDiLrgHCh0+xTV6Ajz9WSR8W2
	 SEM2qQS4aL/KNFsDQPjDKRK1t1fcqDtI4iPp4/k8Jpf6/Xp8RJ+UzfM5PWEA8YJRxt
	 AlgIN0KxUT9pWD56uLS3ilrpOhV60X+u/jYn4izPuZrbc+vPG3OugLCpjLDc6MsVzK
	 vAQTMQHGDFrr+cHgGTnS/qiII5oraUeo893N0WkK4LSxXy2zBTsIwmYtjd4FIoMP9Y
	 5HfRPMPsRA4o1YSOAbUZR+khRsYDX+RDfLdv8Ivnkfn+byryVy8FgUksoPKdK2sKGm
	 mu/1HMeKWQq7NICNhlDwB2UxaxaSqj+rA/LLsfxmtMpu98plJYhm2prV2Ev9plUZZr
	 hj97mY56zJ2YwWnbk0rkNeXKEZ9mpRdA4IHcAoQ5zcGmkj5be4WutqGOTXV15+rIgR
	 RkCz+PVb+A6VsLDeLMAIN4eM=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b771bfe9802so20875066b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Dec 2025 23:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041540; x=1766646340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c7S7hlyro8bVLPaUshenPuh/zyDvp4ao0uVsdHOsDEM=;
        b=YcUu21ubdpUYwbKE3VeZPrwoL6jxTF2Wl+JFZNZJRva9XSAF0IPFFl+6veX2QGnhy7
         HL3wr9XrtTdkaDF6bho2W/ArJisb2bSg5gvX/ej9avwUrTq3irCPw06NmM7xNJLtVo07
         EjmAJQaIeI817SXi4RUs7XokifE88i8l54v5MMJYAebKBojy5xDfrKvY3Dj2eFNOsRNP
         DuDGQy+W9ktfZBLukT0tMXCm471bQHvi2BWQ9C5uDrbgx9hJrsncX2a3Bob/fNPioVXH
         rO7UYUGzXeRdsg2Z/K3x+8nr2zl1/nvmG7/ZjEMmB2whzjNC5IfKtWL/kyLeIcNOauO1
         IHUw==
X-Forwarded-Encrypted: i=1; AJvYcCU//l5IjrmECvjXoJPakKXYEno9BmkyZGt5YDVhRNJMnkK2YyG5B8XRJRM78G/i7rC5JFr91QFRsy5OVGJ7dQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCI5r+ighwsP74PPKFKfslyAg2T28hET9abW4iy1XMVRYI4b5g
	ZjK0R2ttNTHZPgi49NlpixW1Sd8P5wSP12tYI2/xroVDqZA/WhHtvZxatUheJyAMPJmuM5bS//p
	n8W5E/HntYx1HyW+9DlmN1pOXuGKnvNUiMY9JGRqgckTY9ttTm80ZFiR+xQSUxSLyjFtMsnU8Y5
	ocQ7M2P945GCs6h/LnKCwGJlNGkgty2BPn0QyNPhDCCoiPmiwB0O8L6cGKERX930pF
X-Gm-Gg: AY/fxX5wBRrtVQl8DvqTauVLpp+igntgTfc8LqozE4P4mrGWgvW2/qu0dckx1XcUFXg
	C1+T6td2QsQoR/ENnSev3KQRc92Lh4gNqKKsfvACQ9oYPViRW/nrUeFcM5yO77ZPUAVS0JLSSeQ
	9RxD+t71aYmRDncKlc1fEaGIdJOPk0cwRgb4TB9+QMzX91GDULa5s8+lJ+5ukZGBJOn8oEa9jjA
	LCVl8LaeU6Xyw==
X-Received: by 2002:a17:907:9282:b0:b7c:e5d6:2462 with SMTP id a640c23a62f3a-b7d236c1aa1mr2440552966b.28.1766041539959;
        Wed, 17 Dec 2025 23:05:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYGGDlGR8ADZeTuf+I2EP8DPreDJKDZDO7LRoTEnfNBskKW5KUZhOxrJXIujTLMPLzLh8TI5+4XZpPWPsKGLg=
X-Received: by 2002:a17:907:9282:b0:b7c:e5d6:2462 with SMTP id
 a640c23a62f3a-b7d236c1aa1mr2440549866b.28.1766041539543; Wed, 17 Dec 2025
 23:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20251215122231.3180648-1-leon.yen@mediatek.com>
In-Reply-To: <20251215122231.3180648-1-leon.yen@mediatek.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 18 Dec 2025 15:05:27 +0800
X-Gm-Features: AQt7F2rFCwU_nFN8zxCPmULe9M1cSOrOTgxx5yt49VcbBl8x2h-eJIE_P-DiYM4
Message-ID: <CAFv23QnPqdw8v4_k2_sbxhb7p7ZR7fuDJ0CRij=9aX6EC3-4Mg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt792x: Fix a potential deadlock in
 high-load situations
To: Leon Yen <leon.yen@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, deren.wu@mediatek.com, 
	sean.wang@mediatek.com, mingyen.hsieh@mediatek.com, michael.lo@mediatek.com, 
	allan.wang@mediatek.com, quan.zhou@mediatek.com, sarick.jiang@mediatek.com, 
	ryder.lee@mediatek.com, shayne.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_230544_914352_EF12269B 
X-CRM114-Status: GOOD (  19.29  )
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

Leon Yen <leon.yen@mediatek.com> =E6=96=BC 2025=E5=B9=B412=E6=9C=8815=E6=97=
=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=888:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> A deadlock may occur between two works, ps_work and mac_work, if their wo=
rk
> functions run simultaneously as they attempt to cancel each other by
> calling cancel_delayed_work_sync().
>
> mt792x_mac_work() ->   ...  -> cancel_delayed_work_sync(&pm->ps_work);
> mt792x_pm_power_save_work() -> cancel_delayed_work_sync(&mphy->mac_work);
>
> In high-load situations, they are queued but may not have chance to be
> executed until the CPUs are released. Once the CPUs are available, there
> is a high possibility that the ps_work function and mac_work function wil=
l
> be executed simultaneously, resulting in a possible deadlock.
>
> This patch replaces cancel_delayed_work_sync() with cancel_delayed_work()
> in ps_work to eliminate the deadlock and make the code easier to maintain=
.
>
> Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Tested-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

Without the patch, the system may hang during stress tests.
And now I can't reproduce the hang issue with this patch.
Thanks.

> ---
> v2: Modify the solution to make it simpler and easier to maintain
> ---
>  drivers/net/wireless/mediatek/mt76/mt792x_mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt792x_mac.c
> index 71dec93094eb..888e5a505673 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
> @@ -375,7 +375,7 @@ void mt792x_pm_power_save_work(struct work_struct *wo=
rk)
>         }
>
>         if (!mt792x_mcu_fw_pmctrl(dev)) {
> -               cancel_delayed_work_sync(&mphy->mac_work);
> +               cancel_delayed_work(&mphy->mac_work);
>                 return;
>         }
>  out:
> --
> 2.45.2
>
>

