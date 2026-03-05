Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA9FF3D338
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmtEzP0I0EuHpFfZp70CExB77nf4cTFGwGb65ql/OUY=; b=Jjttk4x2KJND2VvVsfWEP4kgLx
	HvVu2IkMzj+O1SrZSfy3evjegIqWiwQ9IYz3X5BM9HCFisvM4GDhLzuWNmjTgFFyo2tUDnTP15Kod
	/1fsxsejoCGGm4PDoNWicW9yCELQo6rFS8csG4fevfQegzP+aKhQwKlNxr1i1ZzC5iHUBUpa54q7j
	zEleRr5DwvTwYC/UmgL1lvNQGcLqufb47/x8zXJllriZbAYjcn+wx+ahLSB84sDCSKRfVkLYk1f9r
	ElfgsdtieiaUCMUQanHkGSCZFVq6oYug+LWdDCQ2N2HVw2LnmiMT4LY8fS0yOIluFCzcd491D70xa
	dLT/2ykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCBM-00000002FyK-0Xk3;
	Thu, 05 Mar 2026 17:08:16 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCBJ-00000002FxQ-3Vum
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 17:08:14 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8c6f21c2d81so781188185a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 09:08:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772730492; cv=none;
        d=google.com; s=arc-20240605;
        b=iWwFrXVth1h5fm7TZ9jrswqxbN/5YgRDusBsJtLRrPldsRHJD9K141v8IyKehP2vTa
         kzYskFmCCwKgKowx5ba82W5v86RT06vGETANfYKbMP52otvGTdBjisF0aGQLB3Zx0J87
         MQ/Mz665uBea/MfIQSCCRfz7LagfXpKsW/L5ckk+j5xtX9hUNOq1FRdQqdaQPcngUnGa
         u2BeI7KiG6W23M5uWR/JbL0s/wa+tg59sdiK+ArYvs5ijpX3FNb6aHktbYW+ChUb/lB4
         FgOmcCf/N1m8vXEORcSLmaeDyreaQ/bncTMiof30Gg9/ra23cffermgnMGzlgUk4aXwi
         s2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmtEzP0I0EuHpFfZp70CExB77nf4cTFGwGb65ql/OUY=;
        fh=am8zDKtpnz+cDR273cNKYcpNZ0b1eVCVAeXjo0Y9iOw=;
        b=X3s+cEmBZH2TvVWfY1CY8SDFs5onof/AqSwDt4teBvJgQvi7k/aKdZotOFW5j4K/f3
         Y0NSUP5nqgnyTpLkpCk4/TlrwcODtRtLgSwrFdRUIQMsBZrabH9hABgF+vYWOMLcwKQk
         I8cmUa0OIOrDrPnViC6NppAR2MvxPD8B6iyHCD8gT3rJG7RGt8cvmbJIqX9i+dess3Ue
         OEMV8guqdvTOKwKkiKXGA2kH33Se+cHhBzScN/k4BKVzC5lEvctYX7ZG5KvLPMcrb7CO
         bYnvcPNz15BRdG21vq6m7qZj5eVeuFN5nWBVLevrLxcium1NnYG9rcz+uT01sDy4zYBH
         hNhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772730492; x=1773335292; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmtEzP0I0EuHpFfZp70CExB77nf4cTFGwGb65ql/OUY=;
        b=guFy3XHA6vzUPKACrk6DS1BK0BUWip35nOrweT+3gDd7GC+j0BX6T3U9qoQ7AdEuqw
         rLLs9Eiae6YBExsAccZTpGxROiuW3auhBS8Ct1/5BfXPHBm353504u48ljYWZ4qsxZqf
         IdCPoBdTTkuVybi0NAa5//BVJVPImOxl9gjTcHshRijOoJWHKhv81lwNKfqq7BC92FEd
         b07q4rVDE8B5cggyr1FoxwqYkY2QwDLAekAbUmuHHjubjKTRYpot4XUqjFrZSCrvXwYN
         qcC/GjR09gCbYvxKiSpxnrKcQ4J8X/nXuL1hLnRZk7AqJBE9OdLq6dzaOKq6FPbS4X7/
         6M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772730492; x=1773335292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bmtEzP0I0EuHpFfZp70CExB77nf4cTFGwGb65ql/OUY=;
        b=b/ZMCtogg2GVYWhaSDqjSZW5v6I80cCeyAtTvB3TGENNPE8sxLdd5EtSMfrdLq5i19
         srUsRO6MbvMpgPCNsRso1+gY2jxaL2GpBFKrRRqAH99JHChDobnI7PW5Ijo9PoPz0cNF
         9pVUeecmzdMCq8YysfsBoxMx/yAjSdBhzMPatRqdDb7ei2kIiJiNpR5UBqCkxKg41NDP
         SwSfger0VcMxwYTGlBmUz2FKNjEsGPR1XK4nlACQY1OSx0IpLmiOq1Z8TsrkSHallxoV
         heCjPPt2vyKPv/GCnTA1DvutFuiADyRB+7ofABfjzDWRqS8EET54k8/LgSzXgG2lruHG
         lPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCViJ/w8+1wt7MpMV+VzzdsEjraYZhQ4PgXMKa0m9GbbH1wyCPeyt1b7CEliqZL2TzA7I1opCp75Hq6empF22w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgxvlLZpfqzJRy9Z9/JiAfsg8M7hayqPBNWVy2OB6TVf2FOYPF
	OgrrOslk+VrI/Ksb6fJTxnBxIW2AqNmmTfEl/ev73fiXjjHWKK4GVAXRqc7TDUg9FHHbP7W6jST
	XcLSEukiKqlGUkpfyOLLHdkO31pkTD6U=
X-Gm-Gg: ATEYQzz1v7P9LSHAZ0G7SM++/1fUdewD2bAjlRKbXx/5RfZfmrdwCQgEkc3z25EoBr0
	tHis3yLEI9dOHjgTxo+2uv1AbynZniJXP+6hpRiB/+bQCgAN83YqNKFkTlNuNKytI3/Im0NfDYH
	9iYAQqWWO9XrbLeIOcPEgHK3ptrCBbnDaXXSGSX464T262XfCqZPYRklbDyUGvYOd0pzJ7Ptsmn
	rEQ+uu/h5lwUBAFpRhukEJlXd2ljZJGQWKouxKRuogtrzZHEjkDqgi5hBNdk3pEcWybV3BkXYKd
	RBHZMbj+
X-Received: by 2002:a05:622a:514:b0:4ee:1875:42fa with SMTP id
 d75a77b69052e-508f1cf7822mr5172761cf.1.1772730492300; Thu, 05 Mar 2026
 09:08:12 -0800 (PST)
MIME-Version: 1.0
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-2-akkun11.open@gmail.com> <20260305-fair-jasper-barracuda-5ae1e6@quoll>
 <9edef237-aab3-4f7f-a86d-ec8796ba87fe@kernel.org>
In-Reply-To: <9edef237-aab3-4f7f-a86d-ec8796ba87fe@kernel.org>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 6 Mar 2026 02:08:00 +0900
X-Gm-Features: AaiRm50-oYM1aGbuVflEDYupYhPjbKtTxzvjoSVqdcYL0WBhL6OK5h-FDkNMe18
Message-ID: <CAKr_iV4W+sSwOLD-CeyC-KZ4=rmWufh4jLiP7LRJHA+ifFL-Vg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 8/10
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_090813_875741_E188132D 
X-CRM114-Status: UNSURE (   8.09  )
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

On Thu, Mar 5, 2026 at 5:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> >        - items:
> >            - enum:
> >                - fairphone,fp1
> > +              - lenovo,b6000-f
> > +              - lenovo,b6000-h
> > +              - lenovo,b8000-f
> > +              - lenovo,b8000-h
>
> I don't see users of few of these. Also, explain in commit msg
> differences between 'f' and 'h'.

On Thu, Mar 5, 2026 at 5:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> I don't see the "blade" used either.

Hi Kozlowski, thank you for your review.

I will remove the unused compatible strings (b6000-f, b6000-h, b8000-h
and blade) in v2. I will also add an explanation to the commit message
that '-f' stands for Wi-Fi-only models and '-h' stands for 3G models.

Note, "blade" can be found in "ro.product.board" (build.prop).
B8000-F: blade10_row_wifi
B6000-H: blade8_row_3gdata

Best regards,
Akari

