Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C4AC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 19:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFh5+vjGuaKWDz3w6hvCEduJqrtLPaXG1Ez5MPQIPeI=; b=0Dtyx5+axtLelXZ1dc3L9L1et4
	7aiU7NLQ66t2SJG96p7YfjkEjFR5N1xqow3dMqipbKj6BaTSneHJpJybkSJDSYNUYRI6omb/I3SwJ
	QkugPj3uMLO+YmKBr4VYq07Xu7HJgdXG3DUhfULMWu5ZL7KSwl/Nn04ClvrukEuiqifWC/bitytAU
	V9Ki6SbQC11broCETXfp8E4KqC97LyWQIKu5y30GfMRqccbepTDlk228diZqW8/H6sQ0yS/jzSYWL
	yh1KE2kKCWPzs5oIU2sl2zZAvQXGm844+Eua9h+CCELwzzxzAtQE3mwz/qRYUxlTZ/PGtTOdwgv0w
	RgOVye3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdw0-003hU7-4q; Fri, 24 Feb 2023 19:40:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdvo-003hS6-CY; Fri, 24 Feb 2023 19:40:37 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDB4A6602FCE;
	Fri, 24 Feb 2023 19:40:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677267633;
	bh=dxJ9OwJ4Yxn8rFPNZc3Z2H2yHUtHPds38dpBl7vM/NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=na0wWdZkVsc60hy1r5q3Wa/BCN8pIGwByZKv8BLqbtsjpLoO4uoQAfIAldSY3DgrG
	 imeYM9EqwANCtSRBvRcUTEQxuGYHfoS7cOvobSD0j1rhLdW0UtQ+TB9J/SOpT4+oSX
	 yiT4IJ3wLIUACNIY/Enzxgo9Y03hSwSu74w6m7Pdgqz2MyoN4ASwTZVuaS6rWRKkuP
	 Oos1jhht2gOWvBdXxj4+PPN6ptfcneJMDdVFqwFhal13bLK3+OnQ1OzzX2NoOqgvv5
	 XD+oa/JoLkVeCPeiLexOi4XD1tJKEzC0XxYNSGsvoWSY5nW/s3Oc9xzbkNnJKS1Y+m
	 qYMCjlg0Dvpag==
Date: Fri, 24 Feb 2023 14:40:27 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC: mt8192: Fixes from initial glance at kselftest
 run
Message-ID: <20230224194027.fmazqn5wx6lhbw5u@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_114036_578822_D0C8AE6D 
X-CRM114-Status: GOOD (  12.14  )
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

On Fri, Feb 24, 2023 at 02:03:54PM +0000, Mark Brown wrote:
> This is a collection of fixes I came up after glancing through an
> initial test run with the Spherion Chromebook on KernelCI.  There are
> more issues flagged, this is just what I fixed thus far - the volume
> controls on the MT6359 have issues for example, and a lot of controls
> aren't marked as Switches like they should be.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Thanks for the fixes.

Tested on a spherion chromebook to make sure audio still works as expected, and
the following tests from mixer-test in the alsa kselftest are fixed:

	# No event generated for MTKAIF_ADDA6_ONLY Switch
	not ok 1910 event_missing.0.13

	# No event generated for MTKAIF_DMIC Switch
	not ok 1917 event_missing.0.12

	# No event generated for Sidetone_Positive_Gain_dB
	# Sidetone_Positive_Gain_dB.0 value -1 less than minimum 0
	# Sidetone_Positive_Gain_dB.0 value 101 more than maximum 100
	not ok 1930 write_invalid.0.10

(no change in pcm-test results)

So,

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

