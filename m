Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C01C27C5E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2pEsKL7o7jrs2TaEo52X5dgZvZI9653hgnLFvrpWSg=; b=lBpdPPnR1KwUIcpOWrwbJuZkYm
	eXwrs6rMOdx0x444bzGPzkH1omx3dB3gr2MXZV1w0vAetf00I2mZQB+3ic/F4VpLPu6LKm+SAac5g
	OfCcOWftA2Q5yWjQeiN1fMdYTMw73gi/rQfF8zlpJlJoCgXFxKSUTOcjgPNW37KW9kDzrZ7ju/LX7
	D+9SFe4RTcInY7J3SBYv41aFq9rYw+zue81FbIpYXr/ElCFlBqZI/azB8hNDZuMFSZd7jV6TP1rMG
	sPKl8rq6iMYSCNC8BaW/g/192F6LmyQ8AmsFzeTU+XvKIAklVFvjNpLby13T/OFNTHxUUG7A38XTM
	SrmqshlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH24t-000000095dv-0deI;
	Tue, 11 Jun 2024 14:02:23 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH24q-000000095cy-0OdN;
	Tue, 11 Jun 2024 14:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718114515; x=1718719315; i=markus.elfring@web.de;
	bh=W2pEsKL7o7jrs2TaEo52X5dgZvZI9653hgnLFvrpWSg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D0Wm4Gejk6TSeDRq9+doUX7Io3ROv8ClPa713A7kmm3ChhE6Vrkx5R67ENav3jiB
	 v+HZkq7zNZW/1ui3mJlE7d9A7Jnb3rkNbaI3Ntq1vN88WwUogv6SufuERrGtwdlkO
	 2aMEyqQlHCMidj4Zpou8EXO0B+Oc5JYfaAmW5X1ugehJErJ0w3T/14bmuObjfHUKR
	 9lRAXbK2xwFDVqSXrmAuQdFMcj8+I2S1pFOsiiZKDI14AGiB1zZo9BRSARPYQ+ClF
	 MKEB/EM3bJ1ebocSbE1SgcludIdq4+tcgcq9CAVw+BBx0vSMTwubcg/aIGQKdsBmA
	 Se9tCmH10v+UbQ7qpw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnG2C-1sihrL0iOa-00dahS; Tue, 11
 Jun 2024 16:01:55 +0200
Message-ID: <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
Date: Tue, 11 Jun 2024 16:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pavel Machek <pavel@ucw.cz>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
Subject: Re: [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vXEYOvaM2JhixxYml/MB3pIPwT5XHFYnYUbXKBTecMbfNFSzCAW
 sglEHnYhxBF/QKA95KliUnr88huv3OXl/oBThbevXPvjUzrL9ptOZyioC1KoLyERAw31xRH
 PYYKTd8TQ++HEf7YLdU7+tBTUrXTMRnG6PX70ZHo/+WWQ3PjsKw9ikG+Jm57wme+sNXBb8h
 9eluliCCFKTyVWamrGCUw==
UI-OutboundReport: notjunk:1;M01:P0:lvl8jcAGd20=;KMJvMO4Y+WSHny/FBJphtdHFrTK
 BTDkJfKQvgkXEAug1o1JXvo58g2oP7YquGiQlBi4/zX1n+/ke6SGlbvAooBsnLF+Q4Q7oaJsC
 zhU/CeXLiYFdlEzqmzb/PpjaEjixr80Sh7WhFm4Sc6grg+s5Uoj0HlM1RHPKSDSXZLu0SE/Kf
 PFmItSaAb3esTcyundO+svoGaQDWqgHMHbcFfvvVaFDyIN/Klp3kqtBa1eW7rJLe6o9Vzb4Wm
 I6dCBxgdtvr4mcbx+glBoGJN+2VALSFoK/QYsMK5S3Ll2z4y6W80fZAcfAOWxQdiEdxC1Dmzf
 9lv5xmXcmfvdgoCkpaugjtGsTckjM4T/w0L9c2GuMBNIeCjn7rQAu7a4y5hWyaoAL9NR0GcQn
 WYYbZ0Nu/dpj1Q2T4wbwHc/28eXeLnd1ZekBiuCh/aS1cU5tFE78RMm1qmFwoc/wyhb9DPxDm
 3W/bE2FGYjWEQD2L1nSw0VQ1AfBOcOyp2480d2RJKZCuVrvxjKjQGmEEhEBMewv+YZT3Xl22o
 CqI80ZrnUA+YWIt6MfdLeugOweV3Oz93UwvR7fuOktr+eG9cMkdHKCJPFlhHSY0fIn/wpVzhB
 iJoFoRqXIpWNCfpXFZb2N1KJa5A5Yaj3rl/PO8vhW/e5pclPMrQDDxXAmqXsngt+MDGv/5UJ+
 aYzgEE4a0i1sBhJoER1ptjqf7trZH0VA86gk+vAUXB5dY8xXdkk8xPAA42BGv4nPgzw07xOFt
 gs04oBU0ZR4UK9gUGkqryvTQn7BsPuLBjhJr0ifUiB1pBhYfn1XdDkM7u3BALBBnrjNqirh/z
 hlX1oRumBXo4GAWZWQVYWHrLkRrIYBA3Y0I3wAghzRnkw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_070220_525531_52AD7226 
X-CRM114-Status: UNSURE (   4.93  )
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

=E2=80=A6
> Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
> in the error paths.

I suggest to apply a goto chain for a while.
https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+go=
to+chain+when+leaving+a+function+on+error+when+using+and+releasing+resourc=
es

Will the application of scope-based resource management become feasible wi=
th another delay?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h#=
L8

Regards,
Markus

