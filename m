Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA22C982D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLk/qXepwU+Sdk80TMQeIbWMJ2U8WIHPfybN4YV+JME=; b=z4KhfzHsW5nokqwQIUAumbv8ne
	iRY9Vpip6jrhiIVq0hME4czQpvyKiOt2xDSX9PfRvNZ8WfRa6ZEwsLy6+wrhRPgqoNlYilH7J/ke4
	Br33Pt2KEL/Fn+ge3nTq4GDtchS30Da6J5f5RF6i6GH6JoTDLrMSBvLBeo2TzdkglEtki8isaG9SI
	JOjaVD6pjyXdvdHRJ+FW8f2IUubuRn9g8o7Nocaehmm2u0r4EIW6jfj8Kwz3JHefT8lR/P4YBh8o2
	6fIpsui7z6prL+P1xr3gQ/lg4Tz5TFBeDWVb6n2oyl01Ez8W+px+J1F9KbNJ1KdkS6KfRcfNop709
	wwY30jNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tpi-0000000Dn4z-2vPl;
	Fri, 18 Sep 2026 08:20:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Tpi-0000000Dn4h-0Msd
	for linux-mediatek@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kLk/qXepwU+Sdk80TMQeIbWMJ2U8WIHPfybN4YV+JME=; b=e/MK5YUFlMpmY32hhhObDKDB0s
	Uadz2v/SFt/7fNmO2EXl/gGLV2iq0l08qK82vGCiLpp1Ej+2qfM8Qx+MVAYN5PtWiQZxdEDKGRkxc
	wRS0y+msRiypyWNvH4GaMB1i/r5xleROdmih5akbMb06YmBprO/xlORyWudlhZ8jw9AxJwRVSnDpA
	omAKaH+T9CXny87CH0CSXelF7++a8OtmzV7qRauEw40kV3FY+QbkQHk2iZaWM8C+v2NFJ9CQFWjlZ
	iTo08NjNFX29CuoZ9eH4xNuvB/CPDumEONfF2UsblUvnvUXsIylMbG48P0znuB7+ETQld4UMPqGW5
	YpB9BBeA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Tpf-00000009mPS-1TGP
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 08:20:33 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6351831so201051f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789719629; x=1790324429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLk/qXepwU+Sdk80TMQeIbWMJ2U8WIHPfybN4YV+JME=;
        b=iUUyXUoC49vtmXlXuwmZ/iFr9JqYOTOMNyyirc0OhOiEh6EnzSXaz2ei1h/IR9jHRd
         iQtFuW5uQMM3+UTg0+Hoj4yMdrmZ6GZRom9z2anLjfjDaVtD306UE2emF2w7aKYLwIJ8
         dZZw6qioD3i3EqCByBxuO48gDus6YxG/gjO/rdj8Z8mLQtUYerD3G8dIgwdRML5I7Isd
         7vSGU1+mIiqScgy+dDl8HE9ylR/An061toMe97BZ0eYr4Gb6N8XNHk8YsMZwHa17qnaz
         9fewZ5E84Zb4Oh3PBbSCxHp5NsXFaYdLnEwje32R0APPnRdxXynxVIEf1QcBRgcaOOal
         NSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789719629; x=1790324429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLk/qXepwU+Sdk80TMQeIbWMJ2U8WIHPfybN4YV+JME=;
        b=Yn0zcdtWhuiFef4PcDfp/HZa1gcVbAB+2oo5KJuCXqOOPMI1n0oHBJTK8UJOceyqyR
         5CDK2eOJ589WVm/tNF2YtYpPWitt+QPPipjyig/NhqHOsQEtutCJ0YtVG/jbZ5NiYEnH
         t18laHV2+Q1QD1GcgqXPzgdgWKNLrgWbWYB49hA9py+5O3xdBQ45W2PJRDy7sp420fjD
         kEM2RymKgSS6Piv+Z1USzh7CIAfY9ezQLrd5Q5LWVvwaoaVduspNOfKPM8GM3p6FBat6
         GoeIt16RihjmDmjw3zbj7t7ew8nRrLletSwhS8sYvxi0e9jfqG0JSI2hjlczT0lkloli
         LSyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuTRpH+eIcZKJFbqjuB/dCCT7Jt8Vub6N42vYtFN8jRc+JmJDKn57Xd051ISolAIf9E3nkaZH9sdXUdA4p3w==@lists.infradead.org
X-Gm-Message-State: AFuF++l6wP1Sardxjn5wyPTxQJGXqKgGAKXd7UDDDkP6KjVcqI8eWtYU
	Tuu6odYNT+syeZLwOLPGDb7PLd8iBDpwbOGIc8kzYIIcz7rXyVBRtm/VinV03PsUEl8=
X-Gm-Gg: AYBFou3wdWE6dopRExtNvWrCbJjArf9rjYkr70ZBVv1q80HZ8T3ldyqOroRiS9f6Vyg
	jOqpUvlzYUHQlroF8JUhuxe1fP+9VhXAtewlRU3GcTho7ahMl16KfMAHLXaCm3Od/mJsBginQ63
	1USOERoDNfcqGhqZ418+AZ2QtEkpaLTAGl7uypGy/deuwExx/ozfbJ6ZfnuvpMxqzdM9VMTPRlb
	05WOVUgngmJdxJxZZ1nDeyKTLKqURNn7KW4v1EDJiH71aeW8Xxpp3BCurgpIc2KphOSSEJjhtXi
	QDIE7kDkn+EdvJOC/wDFvIypcVuGhj5JhLJQBek+e20/9VjBBqQNvWCo+rmgOKgElnru8c3eXvs
	p8dfbicMw0KhlsdCUtB+FDxJq29YCNtdxmWF483xcZ3kOWg7zBZ8l7Fr8LeAP6ULA5ypDW0Q+XI
	ZSC/fKK1GN2hxh9oWegbHCEWg4IBSS1ZKNAmHN8/FKUHzTmSy8aw==
X-Received: by 2002:a05:6000:603:b0:487:41c:515b with SMTP id ffacd0b85a97d-4871e25e2a9mr2371051f8f.30.1789719629172;
        Fri, 18 Sep 2026 01:20:29 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff56905sm2152472f8f.20.2026.09.18.01.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:20:28 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch
Cc: netdev@vger.kernel.org,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	gerg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 1/2] net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
Date: Fri, 18 Sep 2026 11:20:23 +0300
Message-ID: <20260918082024.2697569-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <857a7395-4741-4d2c-abb0-b806e8f9bd78@lunn.ch>
References: <20260918015020.2518315-1-f@lex.la> <20260918015020.2518315-2-f@lex.la> <857a7395-4741-4d2c-abb0-b806e8f9bd78@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_092031_506798_1AE0A3E7 
X-CRM114-Status: GOOD (  11.78  )
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

> Did you consider using devm_regulator_get_enable()?

No. Looking at it now, it is the better shape, but not for this patch.

Two things stop it from being a swap. The driver sets the voltages before
it enables, 1.0 V on core and 3.3 V on io, and get_enable returns an int,
so no handle is left for regulator_set_voltage(). On the BPI-R2, which is
also the example in the binding, both supplies are MT6323 regulators with
a range, vpa 0.5 to 3.65 V and vemc3v3 3.0 to 3.3 V, so those calls are
not decoration. The other is placement: the get is in probe and the enable
is in mt7530_setup(), which DSA calls much later and which resets the chip
on the next lines, so get_enable would bring the rails up at a different
point.

It is still worth doing, for a reason this patch deliberately leaves
alone. mt7530_remove() disables the supplies before
mt7530_remove_common() calls dsa_unregister_switch(), which still writes
switch registers over MDIO, so on a board where those rails really drop
the teardown is talking to a switch that is already off. A devres disable
runs after .remove returns and would fix that too.

So I would keep this one as the NULL check with a Fixes tag, and send the
conversion to net-next, where the voltage handling and the power-up
ordering can be argued on their own.

