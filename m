Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B358EC6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lu8nXfWF4StEd5cXk7Odiuy0VJHd+lkrmuXk0B83iuI=; b=Pt/r417c3MirDRgjU6rcsd6KVu
	Ney1ftkFnAGlUpwVcuPt8HxxOSu3uVFp5fghOBjgw6LEyPeX/gTgBm5aqydZsi2eYEL0KomIE3Zy4
	dLMh4VoRDDWevWGOh3eg5ptirOktdDS+7SgjuYxRAfFxgkx+3L033yQIbh81pvN7VU426shcdG335
	+2IkdKjajT5BFt75sYDLQ/SEBjhlIG51Vdk1Qry1xxVHfHqqc6xbjZnCZclpQIcDcAhXmWriHAFlv
	+V8jVs3foMsxACodoXzKgam9KJ8SK6KMCiB7m8gHpb79VDAb0bXoLnI8nFc8dQhLreFLfBXkDHBJu
	iDERVnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocuOo-006gja-JD; Mon, 26 Sep 2022 20:08:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocuOc-006gda-Hr; Mon, 26 Sep 2022 20:08:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0289A612B5;
	Mon, 26 Sep 2022 20:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C153C433B5;
	Mon, 26 Sep 2022 20:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664222884;
	bh=TS6vb0m3k6eiRDpO3DmxP8c72gZLLIPpPyJF6ZBcDOw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HIrq1+gKpHusqRrsE9hyu1PR1dOy1+wxTaEs2E5+dbq6BOmQFUpDlcbG8JgCSVRDg
	 wimhH/TAGvhgFnJDSBQ/ekhykin3/uFmjChWMo/FMKh6y2v/iJX3W1rOwIwpwCZsm/
	 cSdmqhGIpXtRFeXBMslP1EHfqsVmNM9zW0Uy7NE6xAcaGNAW9N5d4PPowOr8l25Lte
	 yKqiFeYDcg6I/YZRu0W9JlwreRRnMYKL+3k3so5GEKNvOuPpa4jwpNiNPpEgcE8OVY
	 RVqLHG/y1Gh/lBU0faB14y/wvV5c/Knuw04fqeZA9yKWXgrinVlQypw7XSlumAj8WW
	 62E1iAQsPcHpw==
Date: Mon, 26 Sep 2022 13:08:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Liu Shixin <liushixin2@huawei.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: use DEFINE_SHOW_ATTRIBUTE
 to simplify code
Message-ID: <20220926130803.3684471a@kernel.org>
In-Reply-To: <20220922142929.3250844-1-liushixin2@huawei.com>
References: <20220922142929.3250844-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_130806_650202_C87AB135 
X-CRM114-Status: UNSURE (   8.44  )
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

On Thu, 22 Sep 2022 22:29:29 +0800 Liu Shixin wrote:
> Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
> No functional change.

Does not apply cleanly. Please rebase on net-next and put 
[PATCH net-next v2] in the subject when reposting.

