Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3377CCA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mkwbqFuSv2hlymMhsu3M4LU2jbDB6uW9iOmS/v2SLU=; b=afYwGJ0ljzlGIweOzq+qLPPi/l
	w5fiEEl4iuSEV2r4Bv+y6CbF03zkMW24B4FhZ9LO26fHdQALRGqURJY0tIZMkhqo2bstvCgJecDkV
	o5S2+ej47ArHBuexOir127ohockn6kfBV427K8ea+iWBi08zHfDmVtcy7Uy1rWIHOajjK8zz40+7b
	dnFJJj+GFkllq0+v1Ibgw1+xXcMaTGG554raM/838eeoPVTku0PzxSG0OsPI5VczYtdoY2crCmlYv
	SanePlPU08zZY7c0/IXmyRhhBjko83tE+W8borqD1dEZzLxvoxmya2W6QdXoJI1X0M/r1oT3kAMn3
	ijZ6RF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzu3-002mPk-0R;
	Tue, 12 Sep 2023 09:41:51 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfzty-002mOA-1A;
	Tue, 12 Sep 2023 09:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=5mkwbqFuSv2hlymMhsu3M4LU2jbDB6uW9iOmS/v2SLU=;
	t=1694511706; x=1695721306; b=fa+RjTKzcM/im2VbUCLSMeiYpWrEBmdZq70G1+LX4NGXE1E
	D6AlwqW7ysTYVCRUlKPFm+xzvlIQdWVB+2uXPGHz/kAZWcXQ4daG0lMkN2JD6u+TpYojmPt4yFv3L
	VdNuJr4q3pko+N9MG4D6AN19FC2iu2GrFvFyzIEkLJlce0yvdl1XXc4F2ayyalECuT+XyoPwSV2ki
	xzeVPcaTIo+eNNRG4qErPjrmlXaP8JEEFSit7NoUAwsMCBKFbLRBuT5a1YyytoWTYgTzuS/qDoJPS
	sxHOneQghk2eV+aehoctlIYG+9Be/4ekrvRm5rjSTiuQ4JkvJQKCEMd/6tEHkh7w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qfztl-00CXmL-1Z;
	Tue, 12 Sep 2023 11:41:33 +0200
Message-ID: <c44b748307a074d0c250002cdcfe209b8cce93c9.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/8] scripts/gdb/symbols: add specific ko module load
 command
From: Johannes Berg <johannes@sipsolutions.net>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>, Jan Kiszka
	 <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Matthias
	Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>
Cc: chinwen.chang@mediatek.com, qun-wei.lin@mediatek.com,
 linux-mm@kvack.org,  linux-modules@vger.kernel.org, casper.li@mediatek.com,
 akpm@linux-foundation.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,  linux-mediatek@lists.infradead.org
Date: Tue, 12 Sep 2023 11:41:29 +0200
In-Reply-To: <20230808083020.22254-2-Kuan-Ying.Lee@mediatek.com>
References: <20230808083020.22254-1-Kuan-Ying.Lee@mediatek.com>
	 <20230808083020.22254-2-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_024147_164357_A1216D11 
X-CRM114-Status: GOOD (  22.24  )
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

On Tue, 2023-08-08 at 16:30 +0800, Kuan-Ying Lee wrote:
> Add lx-symbols <ko_path> command to support add specific
> ko module.

I'm not sure how this was supposed to work? It should have updated the
documentation, but more importantly, it shouldn't have broken the
documented usage of this command:

      The kernel (vmlinux) is taken from the current working directly. Modu=
les (.ko)
      are scanned recursively, starting in the same directory. Optionally, =
the module
      search path can be extended by a space separated list of paths passed=
 to the
      lx-symbols command.

Note how that talks about a "space separated list of paths" for which
clearly a single path seems like it should be accepted?

> @@ -138,6 +139,19 @@ lx-symbols command."""
>          else:
>              gdb.write("no module object found for '{0}'\n".format(module=
_name))
> =20
> +    def load_ko_symbols(self, mod_path):
> +        self.loaded_modules =3D []
> +        module_list =3D modules.module_list()
> +
> +        for module in module_list:
> +            module_name =3D module['name'].string()
> +            module_pattern =3D ".*/{0}\.ko(?:.debug)?$".format(
> +                module_name.replace("_", r"[_\-]"))
> +            if re.match(module_pattern, mod_path) and os.path.exists(mod=
_path):
> +                self.load_module_symbols(module, mod_path)
> +                return
> +        raise gdb.GdbError("%s is not a valid .ko\n" % mod_path)
> +
>      def load_all_symbols(self):
>          gdb.write("loading vmlinux\n")
> =20
> @@ -176,6 +190,11 @@ lx-symbols command."""
>          self.module_files =3D []
>          self.module_files_updated =3D False
> =20
> +        argv =3D gdb.string_to_argv(arg)
> +        if len(argv) =3D=3D 1:
> +            self.load_ko_symbols(argv[0])
> +            return

But this obviously breaks it, since passing a single path will go into
the if, then complain "some/folder/ is not a valid .ko" and exit.


But I'm not even sure how you intended this to work _at all_, because in
the context before this if, we have:

         self.module_paths =3D [os.path.abspath(os.path.expanduser(p))
                              for p in arg.split()]
         self.module_paths.append(os.getcwd())

so you first add the (file!) to the list of paths, and then try to load
the file by finding modules in the paths, and filtering by the specified
file? That seems ... very roundabout, and can even only work if the file
can be found via os.getcwd(), so you could never specify an absolute
filename?

All that seems counter to what the patch was meant to do.

I suspect that really you need to individually check "is it a file or a
directory" before handling any of this, and if it's actually a file,
don't use it as a _filter_ as you do in load_ko_symbols() now but
directly use it as is with load_module_symbols()?


@Jan, can we revert this? I came up with the following trivial fix that
makes it at least not break the original use case of passing a single-
entry directory list, but it really doesn't seem right one way or the
other.


--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -191,7 +191,7 @@ lx-symbols command."""
         self.module_files_updated =3D False
=20
         argv =3D gdb.string_to_argv(arg)
-        if len(argv) =3D=3D 1:
+        if len(argv) =3D=3D 1 and os.path.isfile(argv[0]):
             self.load_ko_symbols(argv[0])
             return
=20


johannes

