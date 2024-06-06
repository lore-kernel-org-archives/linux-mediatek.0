Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F67C27C54
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hutjf4WwE6IKhYhoDpmSZWk+TUgz4ul3jgLdpMGfmk8=; b=KdYyfbIiVi6TRFb6v/BQNy15KF
	mXzZ1xmWrEds0EOgIVX05G9NzwsrGhXtqNbcqPa3rdaSTYn1AsQOaO2aQoY+k0vCA3UHdQU/Y/E13
	wRID9tU/XRU1aCCtE2qlSG5Q7rCFnLfwRkwW/KIloVjOuFwqunA4rB/Bp3BgU6FG6kzMD7JHC3f51
	94PcBafhE+xFVZZI4vWWS3ZoMepBGurQzca4LP3hxHkPAzifrFI4bF8uHDLzBJOcYlD0jeOuMVRZI
	pqX9zMcQO0yUu5octlJh05d3S68P+4/m+UUnxakizj+1TK8bdx+NFVwok+mSjjPElFig5o9rQEtfg
	oIYNeiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFJRW-0000000BCpU-3DJh;
	Thu, 06 Jun 2024 20:10:38 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFJRT-0000000BCoM-17oe
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 20:10:37 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2e72b8931caso14226961fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Jun 2024 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717704631; x=1718309431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hutjf4WwE6IKhYhoDpmSZWk+TUgz4ul3jgLdpMGfmk8=;
        b=Qstt52HMPZFzrbR1d80MqGe4tGgpjFO5JHCAamswwUT0wrTnMo7ZU/MNh6IgsyCRNC
         uOx8gZWykqTPFKLA9sC0PesO1KeYZ7hP2M92V2LLN7o9q02GoNzW8wLuq8xSOXdIpBFI
         A0BvsOzMGPZHvhEa7ElZ06Zr/5ngeLEsORBFEwy2yD/L/aWhlnoqBtnvjtcT2LiN+Voe
         k41/MaN1ly0fR3XadsEu182yuWheGgXQcqwV6m/9zpEOi9mecmLGTlYi/G5YxBjfgb5U
         KTT0XJvgxqwp75r8V6PRCHksovdp/qobNIaj/Prn9Ydu8RW+wWqRPwZv7jOji9nNihKS
         +VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717704631; x=1718309431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hutjf4WwE6IKhYhoDpmSZWk+TUgz4ul3jgLdpMGfmk8=;
        b=feTNONRukNjpgYsl3b+Qy/pSo4AkAXRS1K8IHLfcFQpRf8s5B/xvFYOuWqTmn1kFJD
         Hi/m/fZnvwSmJMYWoXAiLCUalB2thzOsyn95p1qeqlcvPkj9IJ7lIOtJ00zo8XzaPaNC
         r2kEsuEZeUnAGXJRBCRnfDEbP0gRCsiIUwBJpw5vnuWKuHj6AL0FGpBHZtnMpcpdGu7Y
         aeg+7x7b+uVT0V3ZUuaa63hnpoaT8Xj/vEwrceV63QyVcuqTileJ+jEFeKBiVSFdViee
         sZSdlcxLjNfGFlIPnY87av9Jfg8ARMpqLStvDzBBwfhUVudSWnJSRgJnhdZmmnKqesGY
         YJ0A==
X-Forwarded-Encrypted: i=1; AJvYcCVNAhJFrS73LP8InDsvxlUWxVAagQChJBrjxFnmGi7PlW23QU1Qsbpwd0lghH+D2ipziPircbJ4k0Tj5kJx9ehzeQJGdjTz2tlXtl0ynSzo+iZ4
X-Gm-Message-State: AOJu0YyBJyJf73toRUtzpC7eU71gzTHcU5ubkdT4fCKe+byVbrNVokGR
	v39lNztWnLq4RNK0W9JG/HYqy08qqkWMTmMRTE5nwmjMwsTsP+RtNvxkye48eD2+SAB10xAxLD8
	kneOwlCLRZwYU1DLMiQDAIWMBxEo=
X-Google-Smtp-Source: AGHT+IHAsDb5+nsNxizNL0s50nQsiWVLkPf55QznG57cKaBnbaVfMJ/g6/XbUdNeCRsat4LY6v+75fSHMUV0aMYRwfU=
X-Received: by 2002:a2e:b016:0:b0:2e1:7acb:6c40 with SMTP id
 38308e7fff4ca-2eadce3f9a6mr4248981fa.29.1717704630713; Thu, 06 Jun 2024
 13:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240606114321.30515-1-chris.lu@mediatek.com> <20240606114321.30515-2-chris.lu@mediatek.com>
In-Reply-To: <20240606114321.30515-2-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 6 Jun 2024 16:10:17 -0400
Message-ID: <CABBYNZJdY8Oo5rwoJx7rAFPaTRhYRe7p0CEN52hv+7tBEoYCxg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] Bluetooth: net: add hci_iso_hdr function for iso data
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_131035_331345_C82458E5 
X-CRM114-Status: GOOD (  16.18  )
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

Hi Chris,

On Thu, Jun 6, 2024 at 7:43=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wro=
te:
>
> Add function hci_iso_hdr to get skb->data when packet type is ISO.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  include/net/bluetooth/hci.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index e372a88e8c3f..b9f8f91f6c7f 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -2898,6 +2898,11 @@ static inline struct hci_sco_hdr *hci_sco_hdr(cons=
t struct sk_buff *skb)
>         return (struct hci_sco_hdr *) skb->data;
>  }
>
> +static inline struct hci_iso_hdr *hci_iso_hdr(const struct sk_buff *skb)
> +{
> +       return (struct hci_iso_hdr *) skb->data;
> +}

We might as well check the skb->len before attempting to cast
skb->data or better yet use skb_pull_data but I guess that is not
possible since you don't want to consume the skb?

>  /* Command opcode pack/unpack */
>  #define hci_opcode_pack(ogf, ocf)      ((__u16) ((ocf & 0x03ff)|(ogf << =
10)))
>  #define hci_opcode_ogf(op)             (op >> 10)
> --
> 2.18.0
>


--=20
Luiz Augusto von Dentz

