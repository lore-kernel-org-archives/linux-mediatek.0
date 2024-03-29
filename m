Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE76CD1283
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2QgqTKjYeMV4wupX3c1M3yXu+BukxhArfbC4mqtySY=; b=435aGi7Ap2j6JncAmdNVeLuATK
	xRZzdTuhzUSD9OvdNFNy7PTAh+JpThLDMyYHcpjm3IJld9BM11CtNrYRKhlBUvfqAebQiZEvyaXuB
	LjYlnPbpYzFGxe8QMYKk/S8UsGysr4KCGqUxbBpGq0hQ7xECQhqFuTQD3rkGAX6qlbO1gZDqnDNKM
	pJ9s4XcOESLT0e/WNpammd6Y37lD0WNHL/NN+gTF5D8eanre0DTdBg18UD7ka2D/ySEgjFZ38A2ay
	yK2n/8wANsjDu4+HOzkfRhaqVp2fJZ1Y537tUh78U/X7G2Y+B6jfgN84NeQHPLkrFOTnqH08MpCPU
	MqXPD7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqF9r-00000001Jyg-3pyc;
	Fri, 29 Mar 2024 16:32:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqF9o-00000001JxC-3TPc
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 16:32:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a4e37d4f4c0so80785066b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711729962; x=1712334762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2QgqTKjYeMV4wupX3c1M3yXu+BukxhArfbC4mqtySY=;
        b=KbI171YC6sRrJzZLgGSktF0+zchN4+MGrg2NifqV1q3mj7DFHNEbSEZEuS9aC9VOoJ
         qfwd+wVtPDw5KEswFO2fy44NgDD+hZL++3wE3njgaPs/3N2sqy2r0SougbEZ2G4ztFP3
         PZq2IyJy+sfd+HyD9m18U+oa1Sf5DfbGnWJ7Gqa4dAskQTjjK32QE/ULKBIbYirCxpMJ
         +wAz9Lm/HnNlf+QVvqHAHDnDjDi48c7fisCSwCajCm/U8RECJYra1ffkglEJAfdD7F/j
         rzU95LaDgMIBVOP7fwUFy8ibOUT5demjvgGTmPNJFGyNPIm2Tpf+DSgvkiawOJo434x1
         xfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711729962; x=1712334762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2QgqTKjYeMV4wupX3c1M3yXu+BukxhArfbC4mqtySY=;
        b=OhZHqaOwFEBGTQJwU/c/KdBQeecPL2jLJveqNaKeiBMoFoUxE3eCfA8SKjz3n+PlA8
         8N9geNQ2asK8nH3h23Y8vIiiXfA9vOxAL9H31iX5oOqZBeqK7LfzeNHu0qZ8U+/BdQRt
         XLNbnjaIRAmPHxYilZbLJ4ziBL8WaOH6ducjlbkrbNplqE87wNfbsMvHXj9T7ERoPNJK
         j1/00/F637dLUt37xCwa27vD0CzDEZl3V+Fq1j2sW8VprAlKlF9qk2do/1IB9fHZASdP
         0lGpiD6qYnsqXCNjJCnqUJ/erOKXSVoc4yxtqE98GWITT3ZJ7fPGPtm5zbGUVVgsLAFP
         +NrA==
X-Forwarded-Encrypted: i=1; AJvYcCWWUsRDFB2+5GY5qmBxNCI+uWpbO6WToUyLknCc3zv/D03JHIo3YRwvldArzTAtV/rdIf3K2yGaK7pAyk2J8kNVlyIsfyLNupwchmnRjNnL4Lak
X-Gm-Message-State: AOJu0YyYNenWcOcTutgjO64C2rZ6iVSKdj8Sx9G0gIL1d3/p0OeYTN5s
	dnYPkzpKZjozmfybT4ZvGT/ITaOV8lzainQshO3705yxQ8dAbExaKbkafgXLGXc=
X-Google-Smtp-Source: AGHT+IGu63POJ6YHNg71abi2Y6v6vkpEJuMdYhaSnyay7s2ilQzvpFifN7/DQE4ir9OfMsCUJbqRRw==
X-Received: by 2002:a17:906:39c6:b0:a4e:26a4:bc36 with SMTP id i6-20020a17090639c600b00a4e26a4bc36mr1698829eje.7.1711729962342;
        Fri, 29 Mar 2024 09:32:42 -0700 (PDT)
Received: from linaro.org ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id dl5-20020a170907944500b00a4e28b2639asm1607642ejc.209.2024.03.29.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 09:32:41 -0700 (PDT)
Date: Fri, 29 Mar 2024 18:32:40 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 3/5] spmi: pmic-arb: Make the APID init a
 version operation
Message-ID: <ZgbtKNEJS/m8OQzt@linaro.org>
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
 <20240326-spmi-multi-master-support-v6-3-1c87d8306c5b@linaro.org>
 <9af9cfd1-38c7-4f38-a652-fd046f427f98@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9af9cfd1-38c7-4f38-a652-fd046f427f98@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_093244_949940_AA0C30F6 
X-CRM114-Status: GOOD (  24.46  )
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

On 24-03-28 09:51:49, Neil Armstrong wrote:
> On 26/03/2024 17:28, Abel Vesa wrote:
> > Rather than using conditionals in probe function, add the APID init
> > as a version specific operation. Due to v7, which supports multiple
> > buses, pass on the bus index to be used for sorting out the apid base
> > and count.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >   drivers/spmi/spmi-pmic-arb.c | 199 +++++++++++++++++++++++++++----------------
> >   1 file changed, 124 insertions(+), 75 deletions(-)
> > 
> > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > index 9ed1180fe31f..38fed8a585fe 100644
> > --- a/drivers/spmi/spmi-pmic-arb.c
> > +++ b/drivers/spmi/spmi-pmic-arb.c
> > @@ -183,6 +183,7 @@ struct spmi_pmic_arb {
> >    * struct pmic_arb_ver_ops - version dependent functionality.
> >    *
> >    * @ver_str:		version string.
> > + * @init_apid:		finds the apid base and count
> >    * @ppid_to_apid:	finds the apid for a given ppid.
> >    * @non_data_cmd:	on v1 issues an spmi non-data command.
> >    *			on v2 no HW support, returns -EOPNOTSUPP.
> > @@ -202,6 +203,7 @@ struct spmi_pmic_arb {
> >    */
> >   struct pmic_arb_ver_ops {
> >   	const char *ver_str;
> > +	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> >   	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> >   	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
> >   	int (*offset)(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
> > @@ -942,6 +944,38 @@ static int qpnpint_irq_domain_alloc(struct irq_domain *domain,
> >   	return 0;
> >   }
> > +static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> > +{
> > +	/*
> > +	 * Initialize max_apid/min_apid to the opposite bounds, during
> > +	 * the irq domain translation, we are sure to update these
> > +	 */
> > +	pmic_arb->max_apid = 0;
> > +	pmic_arb->min_apid = pmic_arb->max_periphs - 1;
> > +
> > +	return 0;
> > +}
> > +
> > +static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> > +{
> > +	u32 *mapping_table;
> > +
> > +	if (index) {
> > +		dev_err(&pmic_arb->spmic->dev, "Unsupported buses count %d detected\n",
> > +			index);
> > +		return -EINVAL;
> > +	}
> > +
> > +	mapping_table = devm_kcalloc(&pmic_arb->spmic->dev, pmic_arb->max_periphs,
> > +				     sizeof(*mapping_table), GFP_KERNEL);
> > +	if (!mapping_table)
> > +		return -ENOMEM;
> > +
> > +	pmic_arb->mapping_table = mapping_table;
> 
> Can you specify in the spmi_pmic_arb->mapping_table struct documentation the mapping_table
> is only used in v1 ? or even better rename it to mapping_table_v1
> 

Actually the mapping_table is used on version 1 through 3.

