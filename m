Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC32AC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 19:33:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284D221D79
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 19:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ws5t0bAm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 284D221D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6M4EN6D4DFcjqbnEMB4GAU+2O1mvAO+Gyd6v9CwtjyQ=; b=ws5t0bAm/+XeI63rRIgZGe5q5
	5aNMPvDZAfp//rz+AAieqivyuvI1UyOcsr8FxdwSlnld6LrY7JosG//mvZhkHvAHyH7ighwOpaaL3
	hcZvn+65SALzE2+5L7UeGZr4DSW4wyOwe4bwl2NyUUMHr55M1QYR50i6l1dSycROFRhmHyXOSVHCV
	fhpA4npNe+bXupIPVeEh0GtWEYgLbNDsXXfGAW+Fk6S3MNJ4GZp8XrV7juRR/t2vglpw4Qe3gJiyr
	j7HL1sbcIZH4w5SRAH4YrubS4zXvQeiCiizT5reJZQUraKUEuS24Qaj9MCu40XQ52eFO3lrvFto8Z
	qJclODWAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG5qH-00062s-Mb; Wed, 09 Sep 2020 19:33:17 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG5qF-00062K-JV; Wed, 09 Sep 2020 19:33:16 +0000
Received: by mail-ej1-f67.google.com with SMTP id i22so5249649eja.5;
 Wed, 09 Sep 2020 12:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yh5U4DdKjNhyUaf2ifBbb4LF6J0UbLKo+raAvinnvCc=;
 b=M7vK+bfIuR1djsZNtOVFYqbgx2EJcGCAu1RjjI9LgTQe3rbprWThOASRzVnoBlarAl
 rPPdJP+wy6Z/JtcHcW7+EIMkNMiV8Epyo7M0UNgDEbsHyHQDreLhwu1NlhAngSpLqKyb
 D83+NaKnLfg+pnyCPV28homFHmjciM6T1DFuZ1hyJ5mNOjxY//74wM9gVFPZZU0EJHeU
 l9TxU7u2WMatoRciL4+Jd4SZxvX+TISQ5FRnNo9P+nvoVCl+l/IF1nfqfXNEmYBgyq7E
 rJ1BCjGrdXFZyOLR/9BagMYZ4a3i1jqz0Vv4ymRfQIvo4kO0wo6TrCuypwUZWQtiE8GG
 pPGw==
X-Gm-Message-State: AOAM532NO8VIX1O1yd4BBO4Hz5EFUM2k1BAlLOSiC0J9+F/h4XjVaupE
 SIK9BnpsiDH1Ubx//L/alHexo47KkCA=
X-Google-Smtp-Source: ABdhPJzfLTKoQqFfsuyMyzEyLXyZr0KGpy8lDztIEh6WKkxAjXcD2vd6EVWLi/WVCEqwa5g4EAyG9w==
X-Received: by 2002:a17:906:d97b:: with SMTP id
 rp27mr5520650ejb.18.1599679994274; 
 Wed, 09 Sep 2020 12:33:14 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
 by smtp.googlemail.com with ESMTPSA id 40sm3702732edr.67.2020.09.09.12.33.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 09 Sep 2020 12:33:13 -0700 (PDT)
Date: Wed, 9 Sep 2020 21:33:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: Add binding for MT8167 SMI
Message-ID: <20200909193311.GA15293@kozik-lap>
References: <20200906180938.1117526-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200906180938.1117526-1-fparent@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_153315_658168_D6158DCB 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Sep 06, 2020 at 08:09:37PM +0200, Fabien Parent wrote:
> Add device tree bindings documentation for MT8167 SMI.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.txt        | 3 ++-
>  .../bindings/memory-controllers/mediatek,smi-larb.txt          | 3 ++-

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
